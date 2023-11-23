import Foundation
import OpenAPIKit

public enum Generic {

    public enum Document {

        public static func tags() -> [OpenAPI.Tag] {
            []
        }

        public static func paths() -> OpenAPI.PathItem.Map {
            [:]
        }

        public static func components()
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

        public static func parameters()
            -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
        {
            [
                "genericPageOffset": Parameters.pageOffset(),
                "genericPageLimit": Parameters.pageLimit(),
                "genericSortOrder": Parameters.sortOrder(),
                "genericFilterRelation": Parameters.filterRelation(),
                "genericFilterMethod": Parameters.filterMethod(),
                "genericFilterValue": Parameters.filterValue(),
            ]
        }

    }
}
