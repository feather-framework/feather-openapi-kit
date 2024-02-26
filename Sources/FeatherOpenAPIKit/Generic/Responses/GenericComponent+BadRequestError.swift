extension OperationResponse {

    public static var badRequest: Self {
        .init(400, Generic.Component.Responses.BadRequest.self)
    }
}

extension Generic.Component.Responses {

    public enum BadRequest: JSONResponse {
        public static let description: String = "Bad request"
        public static var schema: Schema.Type = Generic.Component.Schemas
            .BadRequest
            .Error.self
    }
}

extension Generic.Component.Schemas {

    public enum BadRequest {

        public enum Error: ObjectSchema {

            public enum Key: EnumSchema {
                public static let description = """
                    You can use this key for translation purposes.
                    """
                public static let allowedValues = [
                    "missingRequestBody",
                    "invalidRequestBody",
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
