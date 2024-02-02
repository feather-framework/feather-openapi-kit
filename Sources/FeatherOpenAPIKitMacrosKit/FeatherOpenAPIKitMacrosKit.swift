//
//  File.swift
//
//
//  Created by Tibor Bodecs on 26/01/2024.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct FeatherOpenAPIKitMacrosKit: CompilerPlugin {

    let providingMacros: [Macro.Type] = [
        ComponentCollectionMacro.self,
        ComponentCollectionExtensionMacro.self,
    ]
}
