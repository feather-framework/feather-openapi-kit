extension OperationResponse {

    public static var forbidden: Self {
        .init(403, Generic.Component.Responses.Forbidden.self)
    }
}

extension Generic.Component.Responses {

    public enum Forbidden: JSONResponse {
        public static let description: String = "Forbidden"
        public static var schema: Schema.Type = Generic.Component.Schemas
            .Forbidden
            .Error.self
    }
}

extension Generic.Component.Schemas {

    public enum Forbidden {

        public enum Error: ObjectSchema {

            public enum Key: TextSchema {
                public static let description = """
                    The system key of the related object.
                    """
                public static let examples = [
                    "module.model",
                    "foo.bar",
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
