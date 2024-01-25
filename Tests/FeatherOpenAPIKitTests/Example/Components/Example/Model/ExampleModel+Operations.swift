//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension Example.Model {

    @ComponentCollection
    enum Operations {

        struct Get: Operation {

            static func openAPIOperation() -> OpenAPI.Operation {
                .init(
                    tags: Tags.Main.name,
                    summary: "List example",
                    description: """
                        List example detail
                        """,
                    operationId: operationId,
                    responses: [
                        200: Responses.Detail.reference()
                            //                        400: Shared.Component.Responses.BadRequest().reference(),
                            //                        401: Shared.Component.Responses.Unauthorized().reference(),
                            //                        403: Shared.Component.Responses.Forbidden().reference(),
                    ],
                    security: bearerToken()
                )
            }
        }

        struct Create: Operation {

            static func openAPIOperation() -> OpenAPI.Operation {
                .init(
                    tags: Tags.Main.name,
                    summary: "Create example",
                    description: """
                        Create example detail
                        """,
                    operationId: operationId,
                    requestBody: RequestBodies.Create.openAPIRequestBody(),
                    responses: [
                        200: Responses.Detail.reference()
                            //                        401: Shared.Component.Responses.Unauthorized().reference(),
                            //                        403: Shared.Component.Responses.Forbidden().reference(),
                    ],
                    security: bearerToken()
                )
            }
        }

    }
}
