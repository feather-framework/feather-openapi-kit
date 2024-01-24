//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol SecurityScheme: Identifiable {

    func openAPISecurityScheme() -> OpenAPI.SecurityScheme
    func reference() -> [OpenAPI.SecurityRequirement]
}

extension SecurityScheme {

    // NOTE: reference?
    public func reference() -> [OpenAPI.SecurityRequirement] {
        [
            [
                .component(named: id): []
            ]
        ]
    }
}
