//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct ExampleOperation: Operation {

    public func openAPIOperation() -> OpenAPI.Operation {
        .init(
            tags: [
                ExampleTag().id
            ],
            summary: "List profiles",
            description: """
                List available profiles
                """,
            operationId: id,
            parameters: [
                ExampleParameter().reference()
            ],
            responses: [
                200: .response(
                    description: "Ok",
                    content: [
                        .json: FooSchema().reference()
                    ]
                ),
                400: ExampleResponse().reference(),
            ],
            security: ExampleSecurityScheme().reference()
        )
    }
}
