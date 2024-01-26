//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol OpenAPIHeader: Identifiable {
    static func openAPIHeader() -> OpenAPI.Header
}

public protocol Header: OpenAPIHeader {
    static var key: String { get }
    static var title: String { get }
    static var description: String { get }
}

public extension Header {

    static var id: String { key }

    static func openAPIHeader() -> OpenAPI.Header {
        .init(
            schema: .string(
                format: .generic,
                title: title,
                description: description
            )
        )
    }
}
