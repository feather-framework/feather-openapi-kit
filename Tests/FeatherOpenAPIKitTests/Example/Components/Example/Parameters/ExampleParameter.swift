//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.Parameters {
    static var example: ExampleParameter { .init() }
}

public struct ExampleParameter: Parameter {
    
    public func openAPIParameter() -> OpenAPI.Parameter {
        .init(
            name: "exampleId",
            context: .path,
            schema: Components.Schemas.example.reference(),
            description: "example parameter"
        )
    }
}
