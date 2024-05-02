import OpenAPIKit

public protocol BinaryResponse: Response {}

public extension BinaryResponse {
    static func openAPIResponse() -> OpenAPI.Response {
        .init(
            description: description,
            headers: openAPIHeaderMap(),
            content: openAPIContentMap() + [
                .any: .init(schema: .string(contentEncoding: .binary))
            ]
        )
    }
}
