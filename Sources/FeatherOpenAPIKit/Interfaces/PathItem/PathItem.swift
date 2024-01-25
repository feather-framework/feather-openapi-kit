//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol PathItem: Identifiable {

    static var openAPIPath: OpenAPI.Path { get }

    static func openAPIPathItem() -> OpenAPI.PathItem
}

public extension PathItem {
    static var openAPIPath: OpenAPI.Path { .init(stringLiteral: id) }
}
