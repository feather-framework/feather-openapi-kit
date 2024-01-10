//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit
import OpenAPIKitCore

public extension Shared.ComponentKey {

    func reference() -> OpenAPI.Content { .ref(self.rawValue) }
    func reference() -> JSONSchema { .ref(self.rawValue) }
    func reference() -> Either<
        OpenAPI.Reference<OpenAPI.Parameter>, OpenAPI.Parameter
    > { .ref(self.rawValue) }
    func reference() -> Either<
        OpenAPI.Reference<OpenAPI.Response>, OpenAPI.Response
    > { .ref(self.rawValue) }
}

public extension OpenAPI.Response.Map {

    static func list(
        _ key: Shared.ComponentKey,
        _ extras: OpenAPI.Response.Map = [:]
    ) -> Self {
        list(key.rawValue, extras)
    }

    static func create(
        _ key: Shared.ComponentKey,
        _ extras: OpenAPI.Response.Map = [:]
    ) -> Self {
        create(key.rawValue, extras)
    }

    static func detail(
        _ key: Shared.ComponentKey
    ) -> Self {
        detail(key.rawValue)
    }

    static func update(
        _ key: Shared.ComponentKey
    ) -> Self {
        update(key.rawValue)
    }

    static func patch(
        _ key: Shared.ComponentKey
    ) -> Self {
        patch(key.rawValue)
    }
}
