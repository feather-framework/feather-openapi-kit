extension OperationResponse {

    public static var head: Self {
        .init(200, Generic.Component.Responses.Head.self)
    }
}

extension Generic.Component.Responses {

    public enum Head: Response {
        public static let description = "Ok"

        public static let headers: [Header.Type] = [
            Generic.Component.Headers.ContentLength.self
        ]
    }
}
