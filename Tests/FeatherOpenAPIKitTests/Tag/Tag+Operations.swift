import Foundation
import FeatherOpenAPIKit
import OpenAPIKit

extension Tag {

    enum Operations {

        static var list: OpenAPI.Operation {
            .init(
                tags: ["Tag"],
                summary: "List tags",
                description: "List available tags",
                operationId: "listTags",
                parameters: [] + Generic.Parameters.list("Tag"),
                responses: .list("TagList", [404: .ref("404")]),
                security: Generic.Security.bearerAuth
            )
        }

        static var create: OpenAPI.Operation {
            .init(
                tags: ["Tag"],
                summary: "Create a tag",
                description: "Creates a new tag",
                operationId: "createTag",
                parameters: [],
                requestBody: .init(
                    content: [
                        .json: .ref("TagCreate")
                    ]
                ),
                responses: .create("TagDetail", [404: .ref("404")]),
                security: Generic.Security.bearerAuth
            )
        }

        static var bulkDelete: OpenAPI.Operation {
            .init(
                tags: ["Tag"],
                summary: "Bulk delete tags",
                description: "Removes multiple tags at once",
                operationId: "deleteTags",
                parameters: [],
                requestBody: .bulkDelete(),
                responses: .bulkDelete(),
                security: Generic.Security.bearerAuth
            )
        }

        // MARK: - tag id

        static var head: OpenAPI.Operation {
            .init(
                tags: ["Tag"],
                summary: "Tag head",
                description: "Get the head of a tag",
                operationId: "headTag",
                parameters: [
                    .ref("tagId")
                ],
                responses: .head(),
                security: Generic.Security.bearerAuth
            )
        }

        static var detail: OpenAPI.Operation {
            .init(
                tags: ["Tag"],
                summary: "Tag details",
                description: "Get the details of a tag",
                operationId: "getTag",
                parameters: [
                    .ref("tagId")
                ],
                responses: .detail("TagDetail"),
                security: Generic.Security.bearerAuth
            )
        }

        static var update: OpenAPI.Operation {
            .init(
                tags: ["Tag"],
                summary: "Update a tags",
                description: "Updates a tag",
                operationId: "updateTag",
                parameters: [
                    .ref("tagId")
                ],
                requestBody: .init(
                    content: [
                        .json: .ref("TagUpdate")
                    ]
                ),
                responses: .update("TagDetail"),
                security: Generic.Security.bearerAuth
            )
        }

        static var patch: OpenAPI.Operation {
            .init(
                tags: ["Tag"],
                summary: "Patch a tag",
                description: "Patch a given tag",
                operationId: "patchTag",
                parameters: [
                    .ref("tagId")
                ],
                requestBody: .init(
                    content: [
                        .json: .ref("TagPatch")
                    ]
                ),
                responses: .patch("TagDetail"),
                security: Generic.Security.bearerAuth
            )
        }

        static var delete: OpenAPI.Operation {
            .init(
                tags: ["Tag"],
                summary: "Delete a tag",
                description: "Removes a tag using an id",
                operationId: "deleteTag",
                parameters: [
                    .ref("tagId")
                ],
                responses: .delete(),
                security: Generic.Security.bearerAuth
            )
        }
    }
}
