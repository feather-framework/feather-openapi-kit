import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

enum CustomError: Error { case message(String) }

public struct ComponentCollectionMacro: PeerMacro, MemberAttributeMacro {
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

    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingAttributesFor member: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.AttributeSyntax] {

        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            throw CustomError.message(
                "This macro can only be applied to an enum."
            )
        }

        let groupType = enumDecl.name.text
        let nameAndType = try getTypeAndName(groupType)

        if let _ = member.as(EnumDeclSyntax.self) {
            return [
                AttributeSyntax(
                    attributeName:
                        IdentifierTypeSyntax(
                            name: .identifier(
                                "ComponentCollectionLevel_1(\"\(nameAndType.variable)\", \"\(nameAndType.type)\")"
                            )
                        )
                )
            ]
        }

        return []
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

        var collectedMemberNames = ""
        var collectedMemberAdditions = ""

        for member in enumDecl.memberBlock.members {
            if let memberEnumDecl = member.decl.as(EnumDeclSyntax.self) {
                let memberName = memberEnumDecl.name.text

                if let _ = memberEnumDecl.inheritanceClause {
                    collectedMemberNames +=
                        groupType + "." + memberName + ".self,\n"
                }

                collectedMemberAdditions +=
                    " + " + groupType + "." + memberName + "."
                    + nameAndType.variable + "\n"
            }
        }

        let extended = DeclSyntax(
            """
              static let \(raw: nameAndType.variable) : [\(raw: nameAndType.type).Type] = [
                  \(raw: collectedMemberNames)
              ]
                \(raw: collectedMemberAdditions)
            """
        )

        return [extended]
    }
}

public struct ComponentCollectionLevelBase {
    private static func getParameters(_ node: SwiftSyntax.AttributeSyntax)
        throws -> (variable: String, type: String)
    {
        guard let argument = node.arguments?.as(LabeledExprListSyntax.self),
            argument.count == 2
        else {
            throw CustomError.message("Invalid macro parameter.")
        }

        var params: [String] = []

        for param in argument {
            if let paramValue = param.expression.as(
                StringLiteralExprSyntax.self
            )?
            .segments.first?
            .as(StringSegmentSyntax.self)?
            .content.text {
                params.append(paramValue)
            }
        }

        if params.count != 2 {
            throw CustomError.message("Invalid macro parameter.")
        }

        return (params[0], params[1])
    }

    public static func expansion(
        level: Int,
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingAttributesFor member: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.AttributeSyntax] {

        guard let _ = declaration.as(EnumDeclSyntax.self) else {
            throw CustomError.message(
                "This macro can only be applied to an enum."
            )
        }

        let nameAndType = try getParameters(node)

        if let _ = member.as(EnumDeclSyntax.self) {
            return [
                AttributeSyntax(
                    attributeName:
                        IdentifierTypeSyntax(
                            name: .identifier(
                                "ComponentCollectionLevel_\(level)(\"\(nameAndType.variable)\", \"\(nameAndType.type)\")"
                            )
                        )
                )
            ]
        }

        return []
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            throw CustomError.message(
                "This macro can only be applied to an enum."
            )
        }

        let nameAndType = try getParameters(node)

        var collectedMemberNames = ""
        var collectedMemberAdditions = ""

        for member in enumDecl.memberBlock.members {
            if let memberEnumDecl = member.decl.as(EnumDeclSyntax.self) {
                let memberName = memberEnumDecl.name.text

                if let _ = memberEnumDecl.inheritanceClause {
                    collectedMemberNames += memberName + ".self,\n"
                }

                collectedMemberAdditions +=
                    " + " + memberName + "." + nameAndType.variable + "\n"
            }
        }

        let extended = DeclSyntax(
            """
              static let \(raw: nameAndType.variable) : [\(raw: nameAndType.type).Type] = [
                  \(raw: collectedMemberNames)
              ]
                \(raw: collectedMemberAdditions)
            """
        )

        return [extended]
    }

}

public struct ComponentCollectionLevel_1: MemberMacro, MemberAttributeMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingAttributesFor member: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.AttributeSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            level: 2,
            of: node,
            attachedTo: declaration,
            providingAttributesFor: member,
            in: context
        )
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            of: node,
            providingMembersOf: declaration,
            conformingTo: protocols,
            in: context
        )
    }

}

public struct ComponentCollectionLevel_2: MemberMacro, MemberAttributeMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingAttributesFor member: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.AttributeSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            level: 3,
            of: node,
            attachedTo: declaration,
            providingAttributesFor: member,
            in: context
        )
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            of: node,
            providingMembersOf: declaration,
            conformingTo: protocols,
            in: context
        )
    }

}

public struct ComponentCollectionLevel_3: MemberMacro, MemberAttributeMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingAttributesFor member: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.AttributeSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            level: 4,
            of: node,
            attachedTo: declaration,
            providingAttributesFor: member,
            in: context
        )
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            of: node,
            providingMembersOf: declaration,
            conformingTo: protocols,
            in: context
        )
    }

}

public struct ComponentCollectionLevel_4: MemberMacro, MemberAttributeMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingAttributesFor member: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.AttributeSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            level: 5,
            of: node,
            attachedTo: declaration,
            providingAttributesFor: member,
            in: context
        )
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            of: node,
            providingMembersOf: declaration,
            conformingTo: protocols,
            in: context
        )
    }

}

public struct ComponentCollectionLevel_5: MemberMacro, MemberAttributeMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
        providingAttributesFor member: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.AttributeSyntax] {

        throw CustomError.message("Too much level.")
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        return try ComponentCollectionLevelBase.expansion(
            of: node,
            providingMembersOf: declaration,
            conformingTo: protocols,
            in: context
        )
    }

}
