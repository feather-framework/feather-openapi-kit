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
            ExampleField()
        ]
        self.schemas = [
            ExampleSchema()
        ]

        self.parameters = [
            ExampleParameter()
        ]
        self.headers = [
            ExampleHeader()
        ]
        self.requestBodies = [
            ExampleRequestBody()
        ]
        self.securitySchemes = [
            ExampleSecurityScheme()
        ]

        self.responses = [
            ExampleResponse()
        ]

        self.tags = [
            ExampleTag()
        ]
        self.operations = [
            ExampleOperation()
        ]
        self.pathItems = [
            ExamplePathItem()
        ]
    }
}
