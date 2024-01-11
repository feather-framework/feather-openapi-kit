//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit
import OpenAPIKitCore

extension TodoModel {

    enum Identifiers {

        enum Tags {
            static let id: String = "Todo"
        }

        enum Parameters {
            static let id: Shared.ComponentKey = "TodoModelId"
            static let listSortBy: Shared.ComponentKey = "TodoModelListSortBy"
            static let listFilterKey: Shared.ComponentKey =
                "TodoModelListFilterKey"
        }

        enum Components {
            static let reference: Shared.ComponentKey = "TodoModelReference"
            static let detail: Shared.ComponentKey = "TodoModelDetail"
            static let create: Shared.ComponentKey = "TodoModelCreate"
            static let update: Shared.ComponentKey = "TodoModelUpdate"
            static let patch: Shared.ComponentKey = "TodoModelPatch"
            static let list: Shared.ComponentKey = "TodoModelList"
            static let listItem: Shared.ComponentKey = "TodoModelListItem"
            static let listSortBy: Shared.ComponentKey = "TodoModelListSortBy"
            static let listSortItem: Shared.ComponentKey =
                "TodoModelListSortItem"
            static let listFilter: Shared.ComponentKey = "TodoModelListFilter"
            static let listFilterKey: Shared.ComponentKey =
                "TodoModelListFilterKey"
            static let listFilterQueryItem: Shared.ComponentKey =
                "TodoModelListFilterQueryItem"
        }
    }
}
