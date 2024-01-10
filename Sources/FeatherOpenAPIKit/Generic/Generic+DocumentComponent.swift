//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit
import OpenAPIKitCore

extension Generic {

    public struct DocumentComponent: OpenAPIDocumentComponent {

        public init() {}

        public func tags() -> [OpenAPI.Tag] {
            []
        }

        public func paths() -> OpenAPI.PathItem.Map {
            [:]
        }

        public func components()
            -> OpenAPI.ComponentDictionary<JSONSchema>
        {
            [
                "GenericErrorResponse": Components.errorResponse(),
                "GenericErrorResponseDetail": Components.errorResponseDetail(),
                "GenericListPage": Components.listPage(),
                "GenericSortOrder": Fields.sortOrder(),
                "GenericFilterRelation": Fields.filterRelation(),
                "GenericFilterMethod": Fields.filterMethod(),
            ]
        }

        public func parameters()
            -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
        {
            [
                "GenericPageOffset": Parameters.pageOffset(),
                "GenericPageLimit": Parameters.pageLimit(),
                "GenericSortOrder": Parameters.sortOrder(),
                "GenericFilterRelation": Parameters.filterRelation(),
                "GenericFilterMethod": Parameters.filterMethod(),
                "GenericFilterValue": Parameters.filterValue(),
            ]
        }
    }
}
