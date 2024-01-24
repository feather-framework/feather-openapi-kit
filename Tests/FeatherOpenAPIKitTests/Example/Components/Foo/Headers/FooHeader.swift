//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct FooHeader: Header {

    public let id = "X-Foo-Header"

    public func openAPIHeader() -> OpenAPIKit.OpenAPI.Header {
        .init(
            schema: .integer(
                title: "Foo header",
                description: "test"
            )
        )
    }
}
