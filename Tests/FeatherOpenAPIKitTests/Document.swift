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
                responses: composer.responses(),
                parameters: composer.parameters(),
                examples: [:],
                requestBodies: [:],
                headers: [:],
                securitySchemes: composer.securitySchemes()
            ),
            tags: composer.tags()
        )
    }
}
