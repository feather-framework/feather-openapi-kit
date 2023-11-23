import OpenAPIKit

extension Generic {

    public enum SecuritySchemes {

        public static func bearerToken() -> OpenAPI.SecurityScheme {
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
