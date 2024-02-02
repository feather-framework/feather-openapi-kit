import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

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
