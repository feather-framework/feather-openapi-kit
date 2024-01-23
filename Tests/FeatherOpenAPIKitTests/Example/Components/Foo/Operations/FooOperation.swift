//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.Operations {
    static var foo: FooOperation { .init() }
}

public struct FooOperation: Operation {

    public func openAPIOperation() -> OpenAPI.Operation {
        .init(
            tags: [
                Components.Tags.foo.id,
            ],
            summary: "List profiles",
            description: """
                List available profiles
                """,
            operationId: id,
            parameters: [
                Components.Parameters.foo.reference(),
            ],
            responses: [
                200: .response(
                    description: "Ok",
                    content: [
                        .json: Components.Schemas.foo.reference(),
                    ]
                ),
                400: Components.Responses.foo.reference()
            ],
            security: [
//                Components.SecuritySchemes.bearerToken.reference()
            ]
        )
    }
}

