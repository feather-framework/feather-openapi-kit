//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol PathItem: Identifiable {

    var openAPIPath: OpenAPI.Path { get }

    func openAPIPathItem() -> OpenAPI.PathItem
}

public extension PathItem {
    var openAPIPath: OpenAPI.Path { .init(stringLiteral: id) }
}
