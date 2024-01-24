//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct FooOperation: Operation {

    public func openAPIOperation() -> OpenAPI.Operation {
        .init(
            tags: [
                FooField().id
            ],
            summary: "List profiles",
            description: """
                List available profiles
                """,
            operationId: id,
            parameters: [
                FooParameter().reference()
            ],
            responses: [
                200: .response(
                    description: "Ok",
                    content: [
                        .json: FooSchema().reference()
                    ]
                ),
                400: FooResponse().reference(),
            ],
            security: []
        )
    }
}
