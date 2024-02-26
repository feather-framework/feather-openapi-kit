extension OperationResponse {

    public static var noContent: Self {
        .init(204, Generic.Component.Responses.NoContent.self)
    }
}

extension Generic.Component.Responses {

    public enum NoContent: Response {
        public static let description = "No content"
    }
}
