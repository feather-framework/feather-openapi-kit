//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension TodoModel {

    enum Operations {

        static var list: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "List todos",
                description: "List available todo items",
                operationId: "listTodos",
                parameters: Generic.Parameters.list("TodoModel"),
                responses: .list("TodoModelList"),
                security: Generic.Security.bearerAuth
            )
        }

        static var create: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "Create todo",
                description: "Creates a new todo item",
                operationId: "createTodo",
                requestBody: .init(
                    content: [
                        .json: Identifiers.Components.create.reference()
                    ]
                ),
                responses: .create("TodoModelDetail"),
                security: Generic.Security.bearerAuth
            )
        }

        static var bulkDelete: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "Bulk delete todos",
                description: "Removes multiple todo items at once",
                operationId: "deleteTodos",
                requestBody: .bulkDelete(),
                responses: .bulkDelete(),
                security: Generic.Security.bearerAuth
            )
        }

        // MARK: - tag id

        static var head: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "Todo head",
                description: "Get the head of a todo item",
                operationId: "headTodo",
                parameters: [
                    Identifiers.Parameters.id.reference()
                ],
                responses: .head(),
                security: Generic.Security.bearerAuth
            )
        }

        static var detail: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "Todo details",
                description: "Get the details of a todo item",
                operationId: "getTodo",
                parameters: [
                    Identifiers.Parameters.id.reference()
                ],
                responses: .detail("TodoModelDetail"),
                security: Generic.Security.bearerAuth
            )
        }

        static var update: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "Update todo",
                description: "Updates a todo item",
                operationId: "updateTodo",
                parameters: [
                    Identifiers.Parameters.id.reference()
                ],
                requestBody: .init(
                    content: [
                        .json: Identifiers.Components.update.reference()
                    ]
                ),
                responses: .update("TodoModelDetail"),
                security: Generic.Security.bearerAuth
            )
        }

        static var patch: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "Patch todo",
                description: "Patch a given todo item",
                operationId: "patchTodo",
                parameters: [
                    Identifiers.Parameters.id.reference()
                ],
                requestBody: .init(
                    content: [
                        .json: Identifiers.Components.patch.reference()
                    ]
                ),
                responses: .patch("TodoModelDetail"),
                security: Generic.Security.bearerAuth
            )
        }

        static var delete: OpenAPI.Operation {
            .init(
                tags: [
                    Identifiers.Tags.id
                ],
                summary: "Delete todo",
                description: "Removes a todo item using an id",
                operationId: "deleteTodo",
                parameters: [
                    Identifiers.Parameters.id.reference()
                ],
                responses: .delete(),
                security: Generic.Security.bearerAuth
            )
        }
    }
}
