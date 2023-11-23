import OpenAPIKit
import OpenAPIKitCore

public extension OpenAPI.Content {

    static func ref(_ name: String) -> Self {
        .init(schemaReference: .component(named: name))
    }
}

public extension JSONSchema {

    static func ref(_ name: String) -> JSONSchema {
        .reference(.component(named: name))
    }

    static func enumeration(
        description: String,
        allowedValues: [AnyCodable],
        defaultValue: AnyCodable? = nil,
        examples: [AnyCodable] = []
    ) -> JSONSchema {
        .string(
            format: .generic,
            description: description,
            allowedValues: allowedValues,
            defaultValue: defaultValue,
            examples: examples
        )
    }
}

public extension Either<OpenAPI.Reference<OpenAPI.Parameter>, OpenAPI.Parameter>
{

    static func ref(_ name: String) -> Self {
        Self.reference(.component(named: name))
    }
}

public extension Either<OpenAPI.Reference<OpenAPI.Response>, OpenAPI.Response> {

    static func ref(_ name: String) -> Self {
        Self.reference(.component(named: name))
    }
}

public extension OpenAPI.ComponentDictionary {

    static func + (lhs: Self, rhs: Self) -> Self {
        var result = lhs
        for key in rhs.keys {
            result[key] = rhs[key]
        }
        return result
    }
}
