import OpenAPIKit

extension Generic {

    public enum Responses {

        public static func error(_ description: String) -> OpenAPI.Response {
            .init(
                description: description,
                content: [
                    .json: .init(
                        schema: .reference(
                            .component(named: "GenericErrorResponse")
                        )
                    )
                ]
            )
        }
    }
}
