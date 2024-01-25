//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Schema: Identifiable {
    static func openAPISchema() -> JSONSchema
}

public extension Schema {

    static func reference(required: Bool = true) -> JSONSchema {
        .reference(.component(named: id), required: required)
    }

    static func reference() -> OpenAPI.Content {
        .init(schemaReference: .component(named: id))
    }
}
