import Foundation
import FeatherOpenAPIKit
import OpenAPIKit

enum Tag {

    public enum Document {

        public static func tags() -> [OpenAPI.Tag] {
            [
                .init(
                    name: "Tag",
                    description: "Everything about tags..."
                )
            ]
        }

        public static func paths() -> OpenAPI.PathItem.Map {
            [
                "/tags": .init(
                    get: Operations.list,
                    post: Operations.create,
                    delete: Operations.bulkDelete
                ),
                "/tags/{tagId}": .init(
                    get: Operations.detail,
                    put: Operations.update,
                    delete: Operations.delete,
                    head: Operations.head,
                    patch: Operations.patch
                ),
            ]
        }

        public static func components()
            -> OpenAPI.ComponentDictionary<JSONSchema>
        {
            [
                "TagReference": Components.reference,
                "TagDetail": Components.detail,
                "TagCreate": Components.create,
                "TagUpdate": Components.update,
                "TagPatch": Components.patch,
                "TagList": Generic.Components.list("Tag"),
                "TagListItem": Components.listItem,
                "TagListSortBy": Components.listSortBy,
                "TagListSortItem": Generic.Components.listSortItem("Tag"),
                "TagListFilter": Generic.Components.listFilter("Tag"),
                "TagListFilterKey": Components.listFilterKey,
                "TagListFilterQueryItem": Generic.Components
                    .listFilterQueryItem(
                        "Tag"
                    ),
            ]
        }

        public static func parameters()
            -> OpenAPI.ComponentDictionary<OpenAPI.Parameter>
        {
            [
                "tagId": Parameters.id,
                "tagListSortBy": Generic.Parameters.sortBy("Tag"),
                "tagListFilterKey": Generic.Parameters.filterKey("Tag"),
            ]
        }
    }
}
