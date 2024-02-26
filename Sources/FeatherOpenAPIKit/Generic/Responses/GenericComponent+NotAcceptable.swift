extension OperationResponse {

    public static var notAcceptable: Self {
        .init(406, Generic.Component.Responses.NotAcceptable.self)
    }
}

extension Generic.Component.Responses {

    public enum NotAcceptable: JSONResponse {
        public static let description: String = "Not acceptable"
        public static var schema: Schema.Type = Generic.Component.Schemas.NotAcceptable
            .Error.self
    }
}

extension Generic.Component.Schemas {

    public enum NotAcceptable {

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
