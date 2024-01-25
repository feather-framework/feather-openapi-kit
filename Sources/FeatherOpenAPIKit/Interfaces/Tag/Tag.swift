//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Tag: Identifiable {
    static var name: String { get }
    static var description: String { get }

    static func openAPITag() -> OpenAPI.Tag
}

public extension Tag {

    static var name: String { id }
    static var description: String { "" }

    static func openAPITag() -> OpenAPI.Tag {
        .init(name: name, description: description)
    }
}
