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

        public func responses() -> OpenAPI.ComponentDictionary<OpenAPI.Response>
        {
            [
                "204": .init(description: "No content"),
                "400": Generic.Responses.error("Bad request"),
                "401": Generic.Responses.error("Unauthorized"),
                "403": Generic.Responses.error("Forbidden"),
                "404": Generic.Responses.error("Not found"),
                "405": Generic.Responses.error("Method not allowed"),
                "406": Generic.Responses.error("Not acceptable"),
                "409": Generic.Responses.error("Conflict"),
                "410": Generic.Responses.error("Gone"),
                "415": Generic.Responses.error("Unsupported media type"),
                "422": Generic.Responses.error("Unprocessable Content"),
            ]
        }

        public func securitySchemes()
            -> OpenAPI.ComponentDictionary<OpenAPI.SecurityScheme>
        {
            [
                "bearerAuth": Generic.SecuritySchemes.bearerToken()
            ]
        }
    }
}
