//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.Schemas {
    static var example: ExampleSchema { .init() }
}

public struct ExampleSchema: Schema {

    public func openAPISchema() -> JSONSchema {
        .object(
            schemas: [
                .init(Components.Fields.example),
                .init(Components.Fields.example.keyedReference(required: false))
            ]
        )
    }
}

// TODO: proper builder for this...
extension [Either<Schema, OrderedDictionary<String, JSONSchema>>] {
    
}

extension Either<Schema, OrderedDictionary<String, JSONSchema>> {

    init(_ a: A) {
        self = .a(a)
    }

    init(_ b: B) {
        self = .b(b)
    }
}
