//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 17/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.Schemas {
    static var foo: FooSchema { .init() }
}

public struct FooSchema: Schema {
    
    public func openAPISchema() -> JSONSchema {
        .object(
            properties: [
                "bar": Components.Schemas.foo.reference(required: false)
            ]

//            + [
//                Shared.Fields.foo,
//            ]
//            .reduce(into: .init()) { $0[$1.id] = $1.openAPISchema() } // extension
//            
            + Components.Fields.foo.keyedField()
            + Components.Schemas.foo.keyedReference()
            + Components.Fields.foo.keyedReference(required: false)
        )
    }
}


