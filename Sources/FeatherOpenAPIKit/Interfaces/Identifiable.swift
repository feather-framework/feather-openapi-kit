//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Identifiable {
    var id: String { get }
}

public extension Identifiable {

    var id: String {
        String(reflecting: Self.self)
            .replacingOccurrences(of: ".", with: "")
    }
}

public extension Identifiable {
    var componentKey: OpenAPI.ComponentKey { .init(stringLiteral: id) }
}
