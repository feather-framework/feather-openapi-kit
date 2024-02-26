import OpenAPIKit

extension [SecurityScheme.Type] {

    public static var shared: Self {
        [
            Generic.Component.SecuritySchemes.BearerToken.self
        ]
    }
}

extension Generic.Component {

    public enum SecuritySchemes {

        public enum BearerToken: SecurityScheme {
            public static func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
                .init(
                    type: .http(
                        scheme: "bearer",
                        bearerFormat: "token"
                    ),
                    description: "Authorization header using a Bearer token"
                )
            }
        }
    }
}
