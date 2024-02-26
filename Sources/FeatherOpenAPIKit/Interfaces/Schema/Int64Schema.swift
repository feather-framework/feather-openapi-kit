import OpenAPIKit

public protocol Int64Schema: NumberSchema {
    //TODO: use int64, remove Int cast after openapi kit fixed
    associatedtype T = Int
}

//TODO: use int64, remove Int cast after openapi kit fixed
extension Int64Schema where T == Int {

    public static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .integer(
            format: .int64,
            required: true,
            description: description,
            maximum: maximum,
            minimum: minimum,
            defaultValue: defaultValue.map { .init($0) },
            examples: examples.map { .init($0) }
        )
    }
}
