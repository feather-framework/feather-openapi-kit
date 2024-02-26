extension OperationResponse {

    public static var conflict: Self {
        .init(409, Generic.Component.Responses.Conflict.self)
    }
}

extension Generic.Component.Responses {

    public enum Conflict: JSONResponse {
        public static let description: String = "Conflict"
        public static var schema: Schema.Type = Generic.Component.Schemas.Conflict
            .Error
            .self
    }
}

extension Generic.Component.Schemas {

    public enum Conflict {

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
