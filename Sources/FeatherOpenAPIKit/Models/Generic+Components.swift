import Foundation
import OpenAPIKit

extension Generic {

    public enum Components {

        // MARK: - error

        public static func errorResponse() -> JSONSchema {
            .object(
                properties: [
                    "key": .string(
                        required: true,
                        description: "The error key",
                        examples: ["internal_server_error"]
                    ),
                    "message": .string(
                        required: true,
                        description: "The user facing error message",
                        examples: ["Something went wrong with the request."]
                    ),
                    "details": .array(
                        required: true,
                        minItems: 0,
                        maxItems: 1000,
                        items: .ref("GenericErrorResponseDetail")
                    ),
                ]
            )
        }

        public static func errorResponseDetail() -> JSONSchema {
            .object(
                properties: [
                    "key": .string(
                        required: true,
                        description: "The error key",
                        examples: ["field"]
                    ),
                    "message": .string(
                        required: true,
                        description:
                            "The user facing error message",
                        examples: ["Something is wrong with the field."]
                    ),
                ]
            )
        }

        // MARK: - list

        public static func listSortItem(
            _ ref: String
        ) -> JSONSchema {
            .object(
                title: ref + "ListSortItem",
                properties: [
                    "order": .ref("GenericSortOrder"),
                    "by": .ref(ref + "ListSortBy"),
                ]
            )
        }

        public static func listFilterQueryItem(
            _ ref: String
        ) -> JSONSchema {
            .object(
                title: ref + "FilterQueryItem",
                properties: [
                    "method": .ref("GenericFilterMethod"),
                    "key": .ref(ref + "ListFilterKey"),
                    "value": .string(
                        required: true,
                        description: "The associated value for the filter key.",
                        examples: ["foo"]
                    ),
                ]
            )
        }

        public static func listPage() -> JSONSchema {
            .object(
                properties: [
                    "limit": Fields.pageLimit(),
                    "offset": Fields.pageOffset(),
                    "count": Fields.count(),
                ]
            )
        }

        public static func listFilter(
            _ ref: String
        ) -> JSONSchema {
            .object(
                properties: [
                    "relation": .ref("GenericFilterRelation"),
                    "query": .array(
                        required: true,
                        description: "The query items",
                        minItems: 0,
                        maxItems: 1000,
                        items: .ref(ref + "ListFilterQueryItem")
                    ),
                ]
            )
        }

        public static func list(
            _ ref: String
        ) -> JSONSchema {
            .object(
                properties: [
                    "items": .array(
                        required: true,
                        minItems: 0,
                        maxItems: 1000,
                        items: .reference(
                            .component(named: ref + "ListItem")
                        )
                    ),
                    "page": .ref("GenericListPage"),
                    "sort": .array(
                        required: true,
                        description: "The sort items",
                        minItems: 0,
                        maxItems: 1000,
                        items: .ref(ref + "ListSortItem")
                    ),
                    "filter": .ref(ref + "ListFilter"),
                    "count": Fields.count(),
                ]
            )
        }
    }

}
