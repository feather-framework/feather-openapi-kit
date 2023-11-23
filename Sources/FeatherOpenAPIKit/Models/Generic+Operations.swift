import Foundation
import OpenAPIKit

extension Generic {

    public enum Operations {

        public static var healthCheck: OpenAPI.Operation {
            .init(
                tags: ["Generic"],
                summary: "Generic health check",
                description: "Use this endpoint for health checks",
                operationId: #function,
                responses: [
                    200: .response(description: "Ok")
                ]
            )
        }
    }
}
