extension Generic.Component {

    public enum Headers {

        public enum ContentLength: Header {
            public static let name = "Content-Length"
            public static let description: String = "Content length header"
            public static let schema: Schema.Type = Schemas.Headers
                .ContentLength.self
        }
    }
}
