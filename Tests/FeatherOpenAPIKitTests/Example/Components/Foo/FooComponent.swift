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
            FooField()
        ]
        self.schemas = [
            FooSchema()
        ]

        self.parameters = [
            FooParameter()
        ]
        self.headers = [
            FooHeader()
        ]
        self.requestBodies = []
        self.securitySchemes = [
            FooSecurityScheme()
        ]

        self.responses = [
            FooResponse()
        ]

        self.tags = [
            FooTag()
        ]
        self.operations = [
            FooOperation()
        ]
        self.pathItems = [
            FooPathItem()
        ]
    }
}
