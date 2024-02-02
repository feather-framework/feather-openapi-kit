import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

enum CustomError: Error { case message(String) }

public struct ComponentCollectionMacro: PeerMacro {
    public static func getTypeAndName(_ groupType: String) throws -> (
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

    private static func getNodeName(_ parentNodeName: String?, _ nodeName: String) -> String {
        if let parentNodeNameValue = parentNodeName {
            return parentNodeNameValue + "." + nodeName
        }
        
        return nodeName
    }
    
    public static func collectEnumTypes(_ parentNodeName: String?, _ node: MemberBlockSyntax) -> [String] {
        var ret: [String] = []
        
        for member in node.members {
            if let enumDecl = member.decl.as(EnumDeclSyntax.self) {
                let enumName = getNodeName(parentNodeName, enumDecl.name.text)
                
                ret += collectEnumTypes(enumName, enumDecl.memberBlock)
                
                if let _ = enumDecl.inheritanceClause {
                    ret.append(enumName + ".self")
                }
            }
            else if let structDecl = member.decl.as(StructDeclSyntax.self) {
                ret += collectEnumTypes(getNodeName(parentNodeName, structDecl.name.text), structDecl.memberBlock)
            }
            else if let classDecl = member.decl.as(ClassDeclSyntax.self) {
                ret += collectEnumTypes(getNodeName(parentNodeName, classDecl.name.text), classDecl.memberBlock)
            }
        }
        
        return ret
    }
    
    private static func getParameters(_ node: AttributeSyntax) throws -> [String] {
        guard let argument = node.arguments?.as(LabeledExprListSyntax.self) else {
            return []
        }

        guard argument.count == 1 else {
            throw CustomError.message("Invalid macro parameter.")
        }
        
        var params : [String] = []
        
        for param in argument {
            if let arrayParam = param.expression.as(ArrayExprSyntax.self) {
                for element in arrayParam.elements {
                    if let stringExpr = element.expression.as(StringLiteralExprSyntax.self) {
                        if let value = stringExpr.segments.first?.as(StringSegmentSyntax.self) {
                            params.append(value.content.text)
                        }
                    }
                    
                }
            }
        }
        
        return params
    }
    
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {

        let plusMembers = try getParameters(node)
        
        print(plusMembers)
        
        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            throw CustomError.message(
                "This macro can only be applied to an enum."
            )
        }

        let groupType = enumDecl.name.text
        let nameAndType = try getTypeAndName(groupType)
        let collectedMemberTypes = collectEnumTypes(groupType, enumDecl.memberBlock).joined(separator: ",\n")
        
        var collectedPlusMembers = ""
        
        for member in plusMembers {
            collectedPlusMembers += " + " + groupType + "." + member + groupType
        }
        
        let extended = DeclSyntax(
            """
              public static let \(raw: nameAndType.variable) : [\(raw: nameAndType.type).Type] = [
                  \(raw: collectedMemberTypes)
              ]\(raw: collectedPlusMembers)
            """
        )

        return [extended]
    }
}

public struct ComponentCollectionExtensionMacro: MemberMacro {
    private static func getParameters(_ node: AttributeSyntax) throws -> String {
        guard let argument = node.arguments?.as(LabeledExprListSyntax.self),
              argument.count == 1
        else {
            throw CustomError.message("Invalid macro parameter.")
        }
        
        var params : [String] = []
        
        for param in argument {
            if let paramValue = param.expression.as(StringLiteralExprSyntax.self)?.segments.first?.as(StringSegmentSyntax.self)?.content.text {
                params.append(paramValue)
            }
        }
        
        if (params.count != 1) {
            throw CustomError.message("Invalid macro parameter.")
        }
        
        let listName = params[0]
        
        if (listName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            throw CustomError.message("Empty string parameter.")
        }
        
        return listName
    }
    
    public static func expansion(
      of node: AttributeSyntax,
      providingMembersOf declaration: some DeclGroupSyntax,
      conformingTo protocols: [TypeSyntax],
      in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        guard let extDecl = declaration.as(ExtensionDeclSyntax.self) else {
            throw CustomError.message(
                "This macro can only be applied to an extension."
            )
        }

        guard let memberTypeSyntax = extDecl.extendedType.as(MemberTypeSyntax.self) else {
            throw CustomError.message(
                "Invalid member type syntax."
            )
        }
        
        let groupType = memberTypeSyntax.name.text
        let nameAndType = (variable: try getParameters(node), type: try ComponentCollectionMacro.getTypeAndName(groupType).type)
        let collectedMemberTypes = ComponentCollectionMacro.collectEnumTypes(nil, extDecl.memberBlock).joined(separator: ",\n")
        
        let extended = DeclSyntax(
            """
              public static let \(raw: nameAndType.variable)\(raw: groupType) : [\(raw: nameAndType.type).Type] = [
                  \(raw: collectedMemberTypes)
              ]
            """
        )

        return [extended]
    }
}
