extension OperationResponse {

    public static var internalServerError: Self {
        .init(500, Generic.Component.Responses.InternalServerError.self)
    }
}

extension Generic.Component.Responses {

    public enum InternalServerError: JSONResponse {
        public static let description: String = "InternalServerError"
        public static var schema: Schema.Type = Generic.Component.Schemas
            .InternalServerError.Error.self
    }

}

extension Generic.Component.Schemas {

    public enum InternalServerError {

        public enum Error: ObjectSchema {

            public enum Key: TextSchema {
                public static let description = """
                    The key of the related object.
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
