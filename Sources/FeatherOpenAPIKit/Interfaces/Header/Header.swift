//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Header: Identifiable {

    static var key: String { get }

    static func openAPIHeader() -> OpenAPI.Header
}

public extension Header {

    static var id: String { key }
}
