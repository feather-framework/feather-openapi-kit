extension OperationResponse {

    public static var unauthorized: Self {
        .init(401, Generic.Component.Responses.Unauthorized.self)
    }
}

extension Generic.Component.Responses {

    public enum Unauthorized: JSONResponse {
        public static let description: String = "Unauthorized"
        public static var schema: Schema.Type = Generic.Component.Schemas
            .Unauthorized
            .Error.self
    }

}

extension Generic.Component.Schemas {

    public enum Unauthorized {

        public enum Error: ObjectSchema {

            public enum Key: EnumSchema {
                public static let description = """
                    You can use this key for translation purposes.
                    """
                public static let allowedValues = [
                    "invalidUserToken"
                ]
                public static let examples = allowedValues
            }

            public static let description = ""
            public static let properties: [ObjectSchemaProperty] = [
                .init("key", Key.self),
                .init("message", Generic.Component.Schemas.Error.Message.self),
            ]
        }
    }
}
