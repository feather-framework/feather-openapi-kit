import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

enum CustomError: Error { case message(String) }

public struct ComponentCollection: PeerMacro {
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
            do {
                variableName = "fields"
                baseType = "Field"
            }
        case "Schemas":
            do {
                variableName = "schemas"
                baseType = "Schema"
            }
        case "Parameters":
            do {
                variableName = "parameters"
                baseType = "Parameter"
            }
        case "Headers":
            do {
                variableName = "headers"
                baseType = "Header"
            }
        case "RequestBodies":
            do {
                variableName = "requestBodies"
                baseType = "RequestBody"
            }
        case "SecuritySchemes":
            do {
                variableName = "securitySchemes"
                baseType = "SecurityScheme"
            }
        case "Responses":
            do {
                variableName = "responses"
                baseType = "Response"
            }
        case "Tags":
            do {
                variableName = "tags"
                baseType = "Tag"
            }
        case "Operations":
            do {
                variableName = "operations"
                baseType = "Operation"
            }
        case "PathItems":
            do {
                variableName = "pathItems"
                baseType = "PathItem"
            }
        default:
            do {
                throw CustomError.message("Invalid enum name.")
            }
        }

        var collectedMemberNames: String = ""

        for member in enumDecl.memberBlock.members {
            if let memberName = member.decl.as(StructDeclSyntax.self)?.name.text
            {
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

@main
struct FeatherOpenAPIKitMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ComponentCollection.self
    ]
}
