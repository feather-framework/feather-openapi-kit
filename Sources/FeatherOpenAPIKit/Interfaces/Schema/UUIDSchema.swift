//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit
import Foundation

public protocol UUIDSchema: Schema {
    static var examples: [UUID] { get }
}

public extension UUIDSchema {

    static var examples: [UUID] {
        (0..<5).map { _ in .init() }
    }

    static func openAPISchema() -> JSONSchema {
        .string(
            format: .uuid,
            description: description,
            examples: examples.map { .init($0.uuidString) }
        )
    }
}
