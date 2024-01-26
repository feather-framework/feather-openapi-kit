//
//  File.swift
//
//
//  Created by Tibor Bodecs on 26/01/2024.
//

@attached(memberAttribute)
@attached(peer, names: arbitrary)
public macro ComponentCollection() =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionMacro"
    )

@attached(memberAttribute)
@attached(member, names: arbitrary)
public macro ComponentCollectionLevel_1(
    _ arrName: String,
    _ variableName: String
) =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionLevel_1"
    )

@attached(memberAttribute)
@attached(member, names: arbitrary)
public macro ComponentCollectionLevel_2(
    _ arrName: String,
    _ variableName: String
) =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionLevel_2"
    )

@attached(memberAttribute)
@attached(member, names: arbitrary)
public macro ComponentCollectionLevel_3(
    _ arrName: String,
    _ variableName: String
) =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionLevel_3"
    )

@attached(memberAttribute)
@attached(member, names: arbitrary)
public macro ComponentCollectionLevel_4(
    _ arrName: String,
    _ variableName: String
) =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionLevel_4"
    )

@attached(memberAttribute)
@attached(member, names: arbitrary)
public macro ComponentCollectionLevel_5(
    _ arrName: String,
    _ variableName: String
) =
    #externalMacro(
        module: "FeatherOpenAPIKitMacrosKit",
        type: "ComponentCollectionLevel_5"
    )
