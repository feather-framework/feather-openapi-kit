//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol EnumField: Field {
    static var description: String { get }
    static var allowedValues: [String] { get }
    static var defaultValue: String? { get }
    static var examples: [String] { get }
}

public extension EnumField {
    static var defaultValue: String? { nil }
    static var examples: [String] { [] }
}

public extension EnumField {

    static func openAPISchema() -> JSONSchema {
        var anyDefault: AnyCodable? = nil
        if let defaultValue {
            anyDefault = .init(stringLiteral: defaultValue)
        }
        return .enumeration(
            description: description,
            allowedValues: allowedValues.map { .init(stringLiteral: $0) },
            defaultValue: anyDefault,
            examples: examples.map { .init(stringLiteral: $0) }
        )
    }
}
