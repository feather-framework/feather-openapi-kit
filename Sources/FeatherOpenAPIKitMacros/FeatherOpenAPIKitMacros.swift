//
//  File.swift
//
//
//  Created by Tibor Bodecs on 26/01/2024.
//

@attached(peer, names: arbitrary)
public macro ComponentCollection(_ plusMembers: [String] = []) =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionMacro"
    )

@attached(member, names: arbitrary)
public macro ComponentCollectionExtension(_ listName: String) =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionExtensionMacro"
    )
