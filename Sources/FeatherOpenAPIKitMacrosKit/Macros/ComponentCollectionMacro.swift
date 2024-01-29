import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

enum CustomError: Error { case message(String) }

public struct ComponentCollectionMacro: PeerMacro {
    private static func getTypeAndName(_ groupType: String) throws -> (
        variable: String, type: String
    ) {
        switch groupType {
        case "Schemas":
            return ("schemas", "Schema")
        case "Parameters":
            return ("parameters", "Parameter")
        case "Headers":
            return ("headers", "Header")
        case "RequestBodies":
            return ("requestBodies", "RequestBody")
        case "SecuritySchemes":
            return ("securitySchemes", "SecurityScheme")
        case "Responses":
            return ("responses", "Response")
        case "Tags":
            return ("tags", "Tag")
        case "Operations":
            return ("operations", "Operation")
        case "PathItems":
            return ("pathItems", "PathItem")
        default:
            throw CustomError.message("Invalid enum name: \(groupType)")
        }
    }

    private static func collectEnumTypes(_ parentNodeName: String, _ node: MemberBlockSyntax) -> [String] {
        var ret: [String] = []
        
        for member in node.members {
            if let enumDecl = member.decl.as(EnumDeclSyntax.self) {
                let enumName = parentNodeName + "." + enumDecl.name.text
                
                ret += collectEnumTypes(enumName, enumDecl.memberBlock)
                
                if let _ = enumDecl.inheritanceClause {
                    ret.append(enumName + ".self")
                }
            }
            else if let structDecl = member.decl.as(StructDeclSyntax.self) {
                ret += collectEnumTypes(parentNodeName + "." + structDecl.name.text, structDecl.memberBlock)
            }
            else if let classDecl = member.decl.as(ClassDeclSyntax.self) {
                ret += collectEnumTypes(parentNodeName + "." + classDecl.name.text, classDecl.memberBlock)
            }
        }
        
        return ret
    }
    
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {

        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            throw CustomError.message(
                "This macro can only be applied to an enum."
            )
        }

        let groupType = enumDecl.name.text
        let nameAndType = try getTypeAndName(groupType)
        let collectedMemberTypes = collectEnumTypes(groupType, enumDecl.memberBlock).joined(separator: ",\n")
        
        let extended = DeclSyntax(
            """
              static let \(raw: nameAndType.variable) : [\(raw: nameAndType.type).Type] = [
                  \(raw: collectedMemberTypes)
              ]
            """
        )

        return [extended]
    }
}
