extension OperationResponse {

    public static var methodNotAllowed: Self {
        .init(405, Generic.Component.Responses.MethodNotAllowed.self)
    }
}

extension Generic.Component.Responses {

    public enum MethodNotAllowed: JSONResponse {
        public static let description: String = "Method not allowed"
        public static var schema: Schema.Type = Generic.Component.Schemas
            .MethodNotAllowed.Error.self
    }
}

extension Generic.Component.Schemas {

    public enum MethodNotAllowed {

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
