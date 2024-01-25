//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol TextField: Field {
    static var description: String { get }
    static var examples: [String] { get }
}

public extension TextField {

    static func openAPISchema() -> OpenAPIKit.JSONSchema {
        .text(
            description: description,
            examples: examples.map { .init(stringLiteral: $0) }
        )
    }
}
