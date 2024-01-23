//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

public struct FooComponent: Component {
    
//    public let examples: [Example]
    public let fields: [Field]
    public let schemas: [Schema]
    
    public let parameters: [Parameter]
    public let headers: [Header]
    public let requestBodies: [RequestBody]
    public let securitySchemes: [SecurityScheme]

    public let responses: [Response]
    
    public let tags: [Tag]
    public let operations: [Operation]
    public let pathItems: [PathItem]
    
    
    public init() {
        
//        self.examples = [
//        
//        ]
        self.fields = [
            Components.Fields.foo,
        ]
        self.schemas = [
            Components.Schemas.foo,
        ]

        self.parameters = [
            Components.Parameters.foo,
        ]
        self.headers = [
            Components.Headers.foo,
        ]
        self.requestBodies = [
        
        ]
        self.securitySchemes = [
            Components.SecuritySchemes.foo,
        ]
        
        self.responses = [
            Components.Responses.foo,
        ]
        
        self.tags = [
            Components.Tags.foo,
        ]
        self.operations = [
            Components.Operations.foo,
        ]
        self.pathItems = [
            FooPathItem()
        ]
    }
}
