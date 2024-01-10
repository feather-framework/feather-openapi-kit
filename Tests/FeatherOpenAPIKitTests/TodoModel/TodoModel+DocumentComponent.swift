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

        init() {}

        func tags() -> [OpenAPI.Tag] {
            [
                .init(
                    name: "Todo",
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
                "TodoModelReference": Components.reference,
                "TodoModelDetail": Components.detail,
                "TodoModelCreate": Components.create,
                "TodoModelUpdate": Components.update,
                "TodoModelPatch": Components.patch,
                "TodoModelList": Generic.Components.list("TodoModel"),
                "TodoModelListItem": Components.listItem,
                "TodoModelListSortBy": Components.listSortBy,
                "TodoModelListSortItem": Generic.Components.listSortItem(
                    "TodoModel"
                ),
                "TodoModelListFilter": Generic.Components.listFilter(
                    "TodoModel"
                ),
                "TodoModelListFilterKey": Components.listFilterKey,
                "TodoModelListFilterQueryItem": Generic.Components
                    .listFilterQueryItem(
                        "TodoModel"
                    ),
            ]
        }

        func parameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter> {
            [
                "TodoModelId": Parameters.id,
                "TodoModelListSortBy": Generic.Parameters.sortBy("TodoModel"),
                "TodoModelListFilterKey": Generic.Parameters.filterKey(
                    "TodoModel"
                ),
            ]
        }
    }
}
