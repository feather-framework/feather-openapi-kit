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

    func openAPIDocument() -> OpenAPI.Document

//    //    func examples() -> OpenAPI.ComponentDictionary<OpenAPI.Example>
    func schemas() -> OpenAPI.ComponentDictionary<JSONSchema>
    func parameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
    func headers() -> OpenAPI.ComponentDictionary<OpenAPI.Header>
    func requestBodies() -> OpenAPI.ComponentDictionary<OpenAPI.Request>
    func securitySchemes()
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    func responses() -> OpenAPI.ComponentDictionary<OpenAPI.Response>
    func tags() -> [OpenAPI.Tag]
    func paths() -> OpenAPI.PathItem.Map

    func composedDocument(
        info: OpenAPI.Document.Info,
        servers: [OpenAPI.Server]
    ) -> OpenAPI.Document
}

public extension Document {

    //    func examples() -> OpenAPI.ComponentDictionary<OpenAPI.Example> {
    //        [:]
    //    }

    func schemas() -> OpenAPI.ComponentDictionary<JSONSchema> {
        components.reduce([:]) {
            // compose fields (those are OpenAPI schemas under the hood)
            $0
                + $1.fields.reduce(into: [:]) {
                    $0[$1.componentKey] = $1.openAPISchema()
                }
                // compose other objects (regular schemas)
                + $0
                + $1.schemas.reduce(into: [:]) {
                    $0[$1.componentKey] = $1.openAPISchema()
                }
        }
    }

    func parameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter> {
        components.reduce(into: [:]) { into, item in
            for parameter in item.parameters {
                into[parameter.componentKey] = parameter.openAPIParameter()
            }
        }
    }

    func headers() -> OpenAPI.ComponentDictionary<OpenAPI.Header> {
        components.reduce(into: [:]) { into, item in
            for header in item.headers {
                into[header.componentKey] = header.openAPIHeader()
            }
        }
    }

    func requestBodies() -> OpenAPI.ComponentDictionary<OpenAPI.Request> {
        components.reduce(into: [:]) { into, item in
            for response in item.requestBodies {
                into[response.componentKey] = response.openAPIRequestBody()
            }
        }
    }

    func securitySchemes()
        -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
    {
        components.reduce(into: [:]) { into, item in
            for securityScheme in item.securitySchemes {
                into[securityScheme.componentKey] =
                    securityScheme.openAPISecurityScheme()
            }
        }
    }

    func responses() -> OpenAPI.ComponentDictionary<OpenAPI.Response> {
        components.reduce(into: [:]) { into, item in
            for response in item.responses {
                into[response.componentKey] = response.openAPIResponse()
            }
        }
    }

    // MARK: -

    func tags() -> [OpenAPI.Tag] {
        components.reduce([]) {
            $0 + $1.tags.map { $0.openAPITag() }
        }
    }

    func paths() -> OpenAPI.PathItem.Map {

        components.reduce(into: [:]) { into, item in
            for pathItem in item.pathItems {
                into[pathItem.openAPIPath] = .init(pathItem.openAPIPathItem())
            }
        }
    }

    func composedDocument(
        info: OpenAPI.Document.Info,
        servers: [OpenAPI.Server]
    ) -> OpenAPI.Document {
        .init(
            info: info,
            servers: servers,
            paths: paths(),
            components: .init(
                schemas: schemas(),
                responses: responses(),
                parameters: parameters(),
                //                examples: examples(),
                requestBodies: requestBodies(),
                headers: headers(),
                securitySchemes: securitySchemes()
            ),
            tags: tags()
        )
    }
}
