//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Schema: Identifiable {
    func openAPISchema() -> JSONSchema
}

public extension Schema {

    func reference(required: Bool = true) -> JSONSchema {
        .reference(.component(named: id), required: required)
    }

    func reference() -> OpenAPI.Content {
        .init(schemaReference: .component(named: id))
    }
    
    func keyedReference(
        required: Bool = true
    ) -> OrderedDictionary<String, JSONSchema> {
        [
            id: reference(required: required)
        ]
    }
}
