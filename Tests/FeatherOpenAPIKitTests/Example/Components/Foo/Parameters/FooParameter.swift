//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.Parameters {
    static var foo: FooParameter { .init() }
}

public struct FooParameter: Parameter {
    
    public func openAPIParameter() -> OpenAPI.Parameter {
        .init(
            name: "fooId",
            context: .path,
            schema: Components.Fields.foo.reference()
        )
    }
}
