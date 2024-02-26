extension OperationResponse {

    public static var unsupportedMediaType: Self {
        .init(415, Generic.Component.Responses.UnsupportedMediaType.self)
    }
}

extension Generic.Component.Responses {

    public enum UnsupportedMediaType: JSONResponse {
        public static let description: String = "Unsupported media type"
        public static var schema: Schema.Type = Generic.Component.Schemas
            .UnsupportedMediaType.Error.self
    }
}

extension Generic.Component.Schemas {

    public enum UnsupportedMediaType {

        public enum Error: ObjectSchema {

            public enum Key: TextSchema {
                public static let description = """
                    You can use this key for translation purposes.
                    """
                public static let examples = [
                    "application/json",
                    "text/html",
                ]
            }

            public static let description = ""
            public static let properties: [ObjectSchemaProperty] = [
                .init("key", Key.self),
                .init("message", Generic.Component.Schemas.Error.Message.self),
            ]
        }
    }

}
