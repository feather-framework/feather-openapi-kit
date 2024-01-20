//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.Responses {
    static var example: ExampleResponse { .init() }
}

public struct ExampleResponse: Response {
    
    public func openAPIResponse() -> OpenAPI.Response {
        .init(
            description: "lorem ipsum",
            content: [
                .json: Components.Schemas.example.reference(),
            ]
        )
    }
}