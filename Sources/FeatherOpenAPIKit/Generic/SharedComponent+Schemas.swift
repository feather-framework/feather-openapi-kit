import OpenAPIKit

extension Generic.Component {

    public enum Schemas {

        // MARK: -

        public enum Error {

            public enum Message: TextSchema {
                public static let description = """
                    The original error message provided by the system.
                    """
                public static let examples = [
                    "Something went wrong with the request."
                ]
            }
        }

        public enum Headers {
            public enum ContentLength: IntSchema {
                public static var description: String = "Content length"
            }
        }

        // MARK: -

        public enum List {

            public static var properties: [ObjectSchemaProperty] {
                [
                    .init("order", Order.self, required: false),
                    .init("search", Search.self, required: false),
                    .init("page", Page.self),
                    .init("count", Count.self),
                ]
            }

            public enum Count: IntSchema {
                public static let description = "Total elements"
                public static let minimum: Int = 0
                public static let maximum: Int = .max
                public static let defaultValue: Int? = nil
                public static let examples: [Int] = [42]
            }

            // TODO: public enum schema 10, 20, 50, 100, 500, 1000
            public enum Page: ObjectSchema {
                public static let description = "Page properties"

                public static let properties: [ObjectSchemaProperty] = [
                    .init("size", Size.self),
                    .init("index", Index.self),
                ]

                public enum Size: IntSchema {
                    public static let description = "Page size"
                    public static let minimum: Int = 10
                    public static let maximum: Int = 1000
                    public static let defaultValue: Int? = 50
                    public static let examples: [Int] = [10]
                }

                public enum Index: IntSchema {
                    public static let description = "Page index"
                    public static let minimum: Int = 0
                    public static let maximum: Int = .max
                    public static let defaultValue: Int? = 0
                    public static let examples: [Int] = [0]
                }
            }

            public enum Order: EnumSchema {
                public static let description = """
                    Order of the list (ascending or descending).
                    """
                public static let allowedValues = [
                    "asc",
                    "desc",
                ]
                public static let defaultValue: String? = "asc"
                public static let examples = allowedValues
            }

            public enum Search: TextSchema {
                public static let description = "Value of the search term."
                public static let examples = [
                    "foo"
                ]
            }
        }

        // MARK: -

        public enum CreatedAt: DateTimeSchema {
            public static var description: String { "Object creation date" }
        }

        // MARK: -

        public enum UpdatedAt: DateTimeSchema {
            public static var description: String {
                "Last update for the object"
            }
        }

        // see Responses folder
    }
}
