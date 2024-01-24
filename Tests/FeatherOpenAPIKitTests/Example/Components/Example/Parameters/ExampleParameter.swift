//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct ExampleParameter: Parameter {

    public func openAPIParameter() -> OpenAPI.Parameter {
        .init(
            name: "exampleId",
            context: .path,
            schema: ExampleSchema().reference(),
            description: "example parameter"
        )
    }
}
