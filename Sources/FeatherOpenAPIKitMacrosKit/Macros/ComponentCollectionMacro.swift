import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

enum CustomError: Error {

    case message(String)
}

public struct ComponentCollectionMacro: PeerMacro {

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
        let variableName: String
        let baseType: String

        switch groupType {
        case "Fields":
            variableName = "fields"
            baseType = "Field"
        case "Schemas":
            variableName = "schemas"
            baseType = "Schema"
        case "Parameters":
            variableName = "parameters"
            baseType = "Parameter"
        case "Headers":
            variableName = "headers"
            baseType = "Header"
        case "RequestBodies":
            variableName = "requestBodies"
            baseType = "RequestBody"
        case "SecuritySchemes":
            variableName = "securitySchemes"
            baseType = "SecurityScheme"
        case "Responses":
            variableName = "responses"
            baseType = "Response"
        case "Tags":
            variableName = "tags"
            baseType = "Tag"
        case "Operations":
            variableName = "operations"
            baseType = "Operation"
        case "PathItems":
            variableName = "pathItems"
            baseType = "PathItem"
        default:
            throw CustomError.message("Invalid enum name.")
        }

        var collectedMemberNames = ""

        for member in enumDecl.memberBlock.members {
            if let memberName = member.decl.as(EnumDeclSyntax.self)?.name.text {
                collectedMemberNames += groupType + "." + memberName + ".self"

                if enumDecl.memberBlock.members.last != member {
                    collectedMemberNames += ",\n"
                }
            }
        }

        let extended = DeclSyntax(
            """
              static let \(raw: variableName) : [\(raw: baseType).Type] = [
                  \(raw: collectedMemberNames)
              ]
            """
        )

        return [extended]
    }
}
