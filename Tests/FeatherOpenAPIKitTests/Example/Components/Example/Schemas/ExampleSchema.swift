//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct ExampleSchema: Schema {

    public func openAPISchema() -> JSONSchema {
        .object(
            properties: [
                "example": ExampleField().reference()
            ]
        )
    }
}
