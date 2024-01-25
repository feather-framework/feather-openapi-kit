//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol ContextParameter: Parameter {
    static var name: String { get }
    static var context: OpenAPI.Parameter.Context { get }
    static var schema: JSONSchema { get }
    static var description: String { get }
}

public extension ContextParameter {

    static func openAPIParameter() -> OpenAPI.Parameter {
        .init(
            name: name,
            context: context,
            schema: schema,
            description: description
        )
    }
}
