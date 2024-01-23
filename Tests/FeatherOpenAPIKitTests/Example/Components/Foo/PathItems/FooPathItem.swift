//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.PathItems {
    static var foo: FooPathItem { .init() }
}

public struct FooPathItem: PathItem {

    public let id = "/foo/{fooId}"
    
    public func openAPIPathItem() -> OpenAPI.PathItem {
        .init(
            summary: "path summary",
            description: "path description",
            parameters: [    
                Components.Parameters.foo.reference()
            ],
            get: Components.Operations.foo.openAPIOperation()
        )
    }
}
