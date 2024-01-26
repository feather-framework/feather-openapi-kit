//
//  File.swift
//
//
//  Created by Tibor Bodecs on 26/01/2024.
//

@attached(peer, names: arbitrary)
public macro ComponentCollection() =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionMacro"
    )
