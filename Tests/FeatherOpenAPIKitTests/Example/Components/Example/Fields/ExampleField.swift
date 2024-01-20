//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public extension Components.Fields {
    static var example: ExampleField { .init() }
}

public struct ExampleField: Field {
    
    public func openAPISchema() -> OpenAPIKit.JSONSchema {
        .string(examples: [])
    }
}
