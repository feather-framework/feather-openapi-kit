//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.PathItems {
    static var example: ExamplePathItem { .init() }
}

public struct ExamplePathItem: PathItem {

    public let id = "/example/{exampleId}"
    
    public func openAPIPathItem() -> OpenAPI.PathItem {
        .init(
            summary: "path summary",
            description: "path description",
            parameters: [    
                Components.Parameters.example.reference()
            ],
            get: Components.Operations.example.openAPIOperation()
        )
    }
}
