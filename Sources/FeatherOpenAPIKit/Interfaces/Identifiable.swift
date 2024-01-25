//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Identifiable {
    static var id: String { get }
}

public extension Identifiable {

    static var id: String {
        String(reflecting: self)
            .replacingOccurrences(of: ".", with: "")
    }
}

public extension Identifiable {
    static var componentKey: OpenAPI.ComponentKey { .init(stringLiteral: id) }
}
