//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import Foundation
import FeatherOpenAPIKit
import OpenAPIKit

extension TodoModel {

    struct DocumentComponent: OpenAPIDocumentComponent {

        let identifier = "TodoModel"

        init() {}

        func tags() -> [OpenAPI.Tag] {
            [
                .init(
                    name: Identifiers.Tags.id,
                    description: "Everything about todo items..."
                )
            ]
        }

        func paths() -> OpenAPI.PathItem.Map {
            [
                "/todos": .init(
                    get: Operations.list,
                    post: Operations.create,
                    delete: Operations.bulkDelete
                ),
                "/todos/{todoId}": .init(
                    get: Operations.detail,
                    put: Operations.update,
                    delete: Operations.delete,
                    head: Operations.head,
                    patch: Operations.patch
                ),
            ]
        }

        func components() -> OpenAPI.ComponentDictionary<JSONSchema> {
            [
                Identifiers.Components.reference: Components.reference,
                Identifiers.Components.detail: Components.detail,
                Identifiers.Components.create: Components.create,
                Identifiers.Components.update: Components.update,
                Identifiers.Components.patch: Components.patch,
                Identifiers.Components.list: Generic.Components.list(
                    identifier
                ),
                Identifiers.Components.listItem: Components.listItem,
                Identifiers.Components.listSortBy: Components.listSortBy,
                Identifiers.Components.listSortItem: Generic.Components
                    .listSortItem(
                        identifier
                    ),
                Identifiers.Components.listFilter: Generic.Components
                    .listFilter(
                        identifier
                    ),
                Identifiers.Components.listFilterKey: Components.listFilterKey,
                Identifiers.Components.listFilterQueryItem: Generic.Components
                    .listFilterQueryItem(
                        identifier
                    ),
            ]
        }

        func parameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter> {
            [
                Identifiers.Parameters.id: Parameters.id,
                Identifiers.Parameters.listSortBy: Generic.Parameters.sortBy(
                    identifier
                ),
                Identifiers.Parameters.listFilterKey: Generic.Parameters
                    .filterKey(
                        identifier
                    ),
            ]
        }
    }
}
