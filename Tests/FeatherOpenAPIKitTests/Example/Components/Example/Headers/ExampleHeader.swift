//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct ExampleHeader: Header {

    public let id = "X-Example-Header"

    public func openAPIHeader() -> OpenAPIKit.OpenAPI.Header {
        .init(
            schema: .string(
                format: .generic,
                title: "Example header",
                description: "test"
            )
        )
    }
}
