//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct ExampleRequestBody: RequestBody {

    public func openAPIRequestBody() -> OpenAPI.Request {
        .init(
            description: "Example request body",
            content: [
                .json: ExampleSchema().reference()
            ],
            required: true
        )
    }
}
