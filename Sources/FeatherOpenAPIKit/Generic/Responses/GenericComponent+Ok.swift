extension OperationResponse {

    public static var ok: Self {
        .init(200, Generic.Component.Responses.Ok.self)
    }
}

extension Generic.Component.Responses {

    public enum Ok: Response {
        public static let description = "ok"
    }
}
