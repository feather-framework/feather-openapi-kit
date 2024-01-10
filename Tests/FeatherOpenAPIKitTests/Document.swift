//
//  File.swift
//
//
//  Created by Tibor Bodecs on 23/11/2023.
//

import Foundation
import FeatherOpenAPIKit
import OpenAPIKit

extension OpenAPI.Document {

    static var definition: OpenAPI.Document {

        let composer = OpenAPIDocumentComposer([
            Generic.DocumentComponent(),
            TodoModel.DocumentComponent(),
        ])

        return .init(
            info: .init(
                title: "Example API",
                description: "Example API",
                contact: .init(
                    name: "Binary Birds",
                    url: .init(string: "https://binarybirds.com")!,
                    email: "info@binarybirds.com"
                ),
                version: "0.1.0"
            ),
            servers: [
                .init(
                    url: .init(string: "http://localhost:8080")!,
                    description: "dev"
                ),
                .init(
                    url: .init(string: "http://localhost:8081")!,
                    description: "live"
                ),
            ],
            paths: composer.paths(),
            components: .init(
                schemas: composer.components(),
                responses: [
                    "204": .init(description: "No content"),
                    "400": Generic.Responses.error("Bad request"),
                    "401": Generic.Responses.error("Unauthorized"),
                    "403": Generic.Responses.error("Forbidden"),
                    "404": Generic.Responses.error("Not found"),
                    "405": Generic.Responses.error("Method not allowed"),
                    "406": Generic.Responses.error("Not acceptable"),
                    "409": Generic.Responses.error("Conflict"),
                    "410": Generic.Responses.error("Gone"),
                    "415": Generic.Responses.error("Unsupported media type"),
                    "422": Generic.Responses.error("Unprocessable Content"),
                ],
                parameters: composer.parameters(),
                examples: [:],
                requestBodies: [:],
                headers: [:],
                securitySchemes: [
                    "bearerAuth": Generic.SecuritySchemes.bearerToken()
                ]
            ),
            tags: composer.tags()
        )
    }
}
