//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit
import OpenAPIKitCore

extension Generic {

    enum Identifiers {

        enum Tags {
            static let id: String = "Generic"
        }

        enum Parameters {
            static let pageOffset: Shared.ComponentKey = "GenericPageOffset"
            static let pageLimit: Shared.ComponentKey = "GenericPageLimit"
            static let sortOrder: Shared.ComponentKey = "GenericSortOrder"
            static let filterRelation: Shared.ComponentKey =
                "GenericFilterRelation"
            static let filterMethod: Shared.ComponentKey = "GenericFilterMethod"
            static let filterValue: Shared.ComponentKey = "GenericFilterValue"
        }

        enum Components {
            static let errorResponse: Shared.ComponentKey =
                "GenericErrorResponse"
            static let errorResponseDetail: Shared.ComponentKey =
                "GenericErrorResponseDetail"
            static let listPage: Shared.ComponentKey = "GenericListPage"
            static let sortOrder: Shared.ComponentKey = "GenericSortOrder"
            static let filterRelation: Shared.ComponentKey =
                "GenericFilterRelation"
            static let filterMethod: Shared.ComponentKey = "GenericFilterMethod"
        }
    }
}
