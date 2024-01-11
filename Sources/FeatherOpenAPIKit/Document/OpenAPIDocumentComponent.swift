//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit
import OpenAPIKitCore

public protocol OpenAPIDocumentComponent {
    func tags() -> [OpenAPI.Tag]
    func paths() -> OpenAPI.PathItem.Map
    func components() -> OpenAPI.ComponentDictionary<JSONSchema>
    func parameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
    func responses() -> OpenAPI.ComponentDictionary<OpenAPI.Response>
    func securitySchemes()
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
}

public extension OpenAPIDocumentComponent {

    func tags() -> [OpenAPI.Tag] {
        []
    }

    func components() -> OpenAPI.ComponentDictionary<JSONSchema> {
        [:]
    }

    func parameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter> {
        [:]
    }

    func responses() -> OpenAPI.ComponentDictionary<OpenAPI.Response> {
        [:]
    }

    func securitySchemes()
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    {
        [:]
    }
}
