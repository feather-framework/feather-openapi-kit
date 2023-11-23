import Foundation
import OpenAPIKit

extension Generic {

    public enum Parameters {

        public static func list(
            _ ref: String
        ) -> OpenAPI.Parameter.Array {
            [
                .ref("genericPageLimit"),
                .ref("genericPageOffset"),
                .ref(ref.lowercased() + "ListSortBy"),
                .ref("genericSortOrder"),
                .ref("genericFilterRelation"),
                .ref(ref.lowercased() + "ListFilterKey"),
                .ref("genericFilterMethod"),
                .ref("genericFilterValue"),
            ]
        }

        // MARK: -

        public static func pageOffset() -> OpenAPI.Parameter {
            let name = "pageOffset"
            return .init(
                name: name,
                context: .query,
                schema: Fields.pageOffset(),
                description: "The offset of the current page number"
            )
        }

        public static func pageLimit() -> OpenAPI.Parameter {
            let name = "pageLimit"
            return .init(
                name: name,
                context: .query,
                schema: Fields.pageLimit(),
                description: "Limit the number of items per page"
            )
        }

        public static func sortBy(
            _ ref: String
        ) -> OpenAPI.Parameter {
            let name = "sortBy"
            return .init(
                name: name,
                context: .query,
                schema: .array(
                    minItems: 0,
                    maxItems: 10,
                    items: .ref(ref + "ListSortBy")
                ),
                description: "The sort keys in a list"
            )
        }

        public static func sortOrder(  //            defaultValue: String = "asc"
            ) -> OpenAPI.Parameter
        {
            let name = "sortOrder"
            return .init(
                name: name,
                context: .query,
                schema: .array(
                    minItems: 0,
                    maxItems: 10,
                    items: .ref("GenericSortOrder")
                ),
                description: "The order of the sort keys in a list"
            )
        }

        public static func filterRelation() -> OpenAPI.Parameter {
            .init(
                name: "filterRelation",
                context: .query,
                schema: .ref("GenericFilterRelation"),
                description: "The filter relation between the items"
            )
        }

        public static func filterKey(
            _ ref: String
        ) -> OpenAPI.Parameter {
            .init(
                name: "filterKey",
                context: .query,
                schema: .array(
                    minItems: 0,
                    maxItems: 10,
                    items: .ref(ref + "ListFilterKey")
                ),
                description: "The filter keys in a list"
            )
        }

        public static func filterMethod() -> OpenAPI.Parameter {
            .init(
                name: "filterMethod",
                context: .query,
                schema: .array(
                    minItems: 0,
                    maxItems: 10,
                    items: .ref("GenericFilterMethod")
                ),
                description: "The filter methods in a list"
            )
        }

        public static func filterValue() -> OpenAPI.Parameter {
            .init(
                name: "filterValue",
                context: .query,
                schema: .array(
                    minItems: 0,
                    maxItems: 10,
                    items: .string(
                        format: .generic,
                        description: "The filter value"
                    )
                ),
                description: "The filter values in a list"
            )
        }
    }
}
