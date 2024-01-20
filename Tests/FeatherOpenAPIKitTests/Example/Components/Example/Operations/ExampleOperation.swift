//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.Operations {
    static var example: ExampleOperation { .init() }
}

public struct ExampleOperation: Operation {
    
    public func openAPIOperation() -> OpenAPI.Operation {
        .init(
            tags: [
                Components.Tags.example.id,
            ],
            summary: "List profiles",
            description: """
                List available profiles
                """,
            operationId: id,
            parameters: [
                Components.Parameters.example.reference(),
            ],
            responses: [
                200: .response(
                    description: "Ok",
                    content: [
                        .json: Components.Schemas.foo.reference(),
                    ]
                ),
                400: Components.Responses.example.reference()
            ],
            security: Components.SecuritySchemes.example.reference()
        )
    }
}
