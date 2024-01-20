//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.SecuritySchemes {
    static var example: ExampleSecurityScheme { .init() }
}

public struct ExampleSecurityScheme: SecurityScheme {

    public func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
        .init(
            type: .http(
                scheme: "bearer",
                bearerFormat: "token"
            ),
            description: "Authorization header using a Bearer token"
        )
    }

    
}