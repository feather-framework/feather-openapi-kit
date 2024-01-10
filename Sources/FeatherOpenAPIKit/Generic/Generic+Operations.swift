//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import Foundation
import OpenAPIKit

extension Generic {

    public enum Operations {

        public static var healthCheck: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "Health check",
                description: "Use this endpoint for health checks",
                operationId: "healthCheck",
                responses: [
                    200: .response(description: "Ok")
                ]
            )
        }
    }
}
