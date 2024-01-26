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
        ComponentCollectionLevel_1.self,
        ComponentCollectionLevel_2.self,
        ComponentCollectionLevel_3.self,
        ComponentCollectionLevel_4.self,
        ComponentCollectionLevel_5.self,
    ]
}
