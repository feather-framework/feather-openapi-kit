//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

public struct ExampleComponent: Component {
    
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
            Components.Fields.example,
        ]
        self.schemas = [
            Components.Schemas.example,
        ]

        self.parameters = [
            Components.Parameters.example,
        ]
        self.headers = [
            Components.Headers.example,
        ]
        self.requestBodies = [
            Components.RequestBodies.example,
        ]
        self.securitySchemes = [
            Components.SecuritySchemes.example,
        ]
        
        self.responses = [
            Components.Responses.example,
        ]
        
        self.tags = [
            Components.Tags.example,
        ]
        self.operations = [
            Components.Operations.example,
        ]
        self.pathItems = [
            ExamplePathItem()
        ]
    }
}
