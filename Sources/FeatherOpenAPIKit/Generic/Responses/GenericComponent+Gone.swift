extension OperationResponse {

    public static var gone: Self {
        .init(410, Generic.Component.Responses.Gone.self)
    }
}

extension Generic.Component.Responses {

    public enum Gone: JSONResponse {
        public static let description: String = "Gone"
        public static var schema: Schema.Type = Generic.Component.Schemas.Gone
            .Error
            .self
    }
}

extension Generic.Component.Schemas {

    public enum Gone {

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
