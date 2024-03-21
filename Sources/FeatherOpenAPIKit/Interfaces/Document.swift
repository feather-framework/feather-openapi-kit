//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit
import OpenAPIKitCore

// https://spec.openapis.org/oas/latest.html
public protocol Document {
    var components: [Component.Type] { get }

    func openAPIDocument() throws -> OpenAPI.Document

    func schemas() throws -> OpenAPI.ComponentDictionary<JSONSchema>
    func parameters() throws -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
    func headers() throws -> OpenAPI.ComponentDictionary<OpenAPI.Header>
    func requestBodies() throws -> OpenAPI.ComponentDictionary<OpenAPI.Request>
    func securitySchemes() throws
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    func responses() throws -> OpenAPI.ComponentDictionary<OpenAPI.Response>
    func tags() throws -> [OpenAPI.Tag]
    func paths() throws -> OpenAPI.PathItem.Map

    func composedDocument(
        info: OpenAPI.Document.Info,
        servers: [OpenAPI.Server]
    ) throws -> OpenAPI.Document
}

public struct ComposeDocumentError: Swift.Error {
    public let message: String
}

public extension Document {

    static private func filterIdentifiables<T>(
        lists: [[T]]
    ) throws -> [String: T] {
        var ret: [String: T] = [:]

        for list in lists {
            for item in list {
                let itemId = item as! any Identifiable.Type

                if ret[itemId.id] != nil {
                    if itemId.override == false {
                        throw ComposeDocumentError.init(
                            message:
                                "Feather OpenAPI item id is duplicated: '\(itemId.id)' (Did you forget to include override=true?)"
                        )
                    }
                }
                else {
                    if itemId.override {
                        throw ComposeDocumentError.init(
                            message:
                                "Feather OpenAPI item '\(itemId.id)' is set as override but has no parent. (Components order is ok?)"
                        )
                    }
                }

                ret[itemId.id] = item
            }
        }

        return ret
    }

    func schemas() throws -> OpenAPI.ComponentDictionary<JSONSchema> {
        return
            try Self.filterIdentifiables(
                lists: components.map {
                    $0.schemas
                }
            )
            .reduce(into: [:]) { into, item in
                into[item.value.componentKey] = item.value.openAPISchema()
            }
    }

    func parameters() throws -> OpenAPI.ComponentDictionary<OpenAPI.Parameter> {
        return
            try Self.filterIdentifiables(
                lists: components.map {
                    $0.parameters
                }
            )
            .reduce(into: [:]) { into, item in
                into[item.value.componentKey] = item.value.openAPIParameter()
            }
    }

    func headers() throws -> OpenAPI.ComponentDictionary<OpenAPI.Header> {
        return
            try Self.filterIdentifiables(
                lists: components.map {
                    $0.headers
                }
            )
            .reduce(into: [:]) { into, item in
                into[item.value.componentKey] = item.value.openAPIHeader()
            }
    }

    func requestBodies() throws -> OpenAPI.ComponentDictionary<OpenAPI.Request>
    {
        return
            try Self.filterIdentifiables(
                lists: components.map {
                    $0.requestBodies
                }
            )
            .reduce(into: [:]) { into, item in
                into[item.value.componentKey] = item.value.openAPIRequestBody()
            }
    }

    func securitySchemes() throws
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    {
        return
            try Self.filterIdentifiables(
                lists: components.map {
                    $0.securitySchemes
                }
            )
            .reduce(into: [:]) { into, item in
                into[item.value.componentKey] = item.value
                    .openAPISecurityScheme()
            }
    }

    func responses() throws -> OpenAPI.ComponentDictionary<OpenAPI.Response> {
        return
            try Self.filterIdentifiables(
                lists: components.map {
                    $0.responses
                }
            )
            .reduce(into: [:]) { into, item in
                into[item.value.componentKey] = item.value.openAPIResponse()
            }
    }

    // MARK: -

    func tags() throws -> [OpenAPI.Tag] {
        return
            try Self.filterIdentifiables(
                lists: components.map {
                    $0.tags
                }
            )
            .reduce(into: []) { into, item in
                into.append(item.value.openAPITag())
            }
            .sorted { lhs, rhs in
                lhs.name < rhs.name
            }
    }

    func paths() throws -> OpenAPI.PathItem.Map {
        return
            try Self.filterIdentifiables(
                lists: components.map {
                    $0.pathItems
                }
            )
            .reduce(into: [:]) { into, item in
                into[item.value.openAPIPath] = .init(
                    item.value.openAPIPathItem()
                )
            }
    }

    func composedDocument(
        info: OpenAPI.Document.Info,
        servers: [OpenAPI.Server]
    ) throws -> OpenAPI.Document {
        .init(
            info: info,
            servers: servers,
            paths: try paths(),
            components: .init(
                schemas: try schemas(),
                responses: try responses(),
                parameters: try parameters(),
                requestBodies: try requestBodies(),
                headers: try headers(),
                securitySchemes: try securitySchemes()
            ),
            tags: try tags()
        )
    }
}
