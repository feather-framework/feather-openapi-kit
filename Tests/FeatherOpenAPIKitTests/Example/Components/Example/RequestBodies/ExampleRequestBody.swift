//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.RequestBodies {
    static var example: ExampleRequestBody { .init() }
}

public struct ExampleRequestBody: RequestBody {

    public func openAPIRequestBody() -> OpenAPI.Request {
        .init(
            description: "Example request body", 
            content: [
                .json: Components.Schemas.example.reference(),
            ],
            required: true
        )
    }
}
