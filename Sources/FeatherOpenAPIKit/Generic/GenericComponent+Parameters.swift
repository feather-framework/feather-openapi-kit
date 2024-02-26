import OpenAPIKit

extension Generic.Component {

    public enum Parameters {

        public enum List {

            public static var parameters: [Parameter.Type] {
                [
                    Search.self,
                    PageSize.self,
                    PageIndex.self,
                    Order.self,
                ]
            }

            public enum Search: QueryParameter {
                public static let name = "search"
                public static let description = "The list search value"
                public static let schema: Schema.Type = Schemas.List.Search.self
            }

            public enum PageSize: QueryParameter {
                public static let name = "pageSize"
                public static let description =
                    "The number of items per page"
                public static let schema: Schema.Type = Schemas.List.Page.Size
                    .self
            }

            public enum PageIndex: QueryParameter {
                public static let name = "pageIndex"
                public static let description =
                    "The current page number"
                public static let schema: Schema.Type = Schemas.List.Page.Index
                    .self
            }

            public enum Order: QueryParameter {
                public static let name = "order"
                public static let description = "Sort order parameter"
                public static let schema: Schema.Type = Schemas.List.Order.self
            }
        }

    }
}
