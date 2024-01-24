//
//  File.swift
//
//
//  Created by Tibor Bodecs on 17/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct FooSchema: Schema {

    public func openAPISchema() -> JSONSchema {
        .object(
            properties: [
                "foo": FooField().reference(required: false),
                "bar": FooField().reference(),
                "baz": FooField().openAPISchema(),
            ]
        )
    }
}
