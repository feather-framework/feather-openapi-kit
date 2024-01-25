//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol SecurityScheme: Identifiable {

    static func openAPISecurityScheme() -> OpenAPI.SecurityScheme

    static func reference() -> [OpenAPI.SecurityRequirement]
}

public extension SecurityScheme {

    static func reference() -> [OpenAPI.SecurityRequirement] {
        [
            [
                .component(named: id): []
            ]
        ]
    }
}
