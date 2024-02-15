//
//  File.swift
//
//
//  Created by Tibor Bodecs on 15/02/2024.
//

import OpenAPIKit

public protocol HeaderParameter: Parameter {
    static var required: Bool { get }
}

public extension HeaderParameter {

    static var required: Bool { true }

    static var context: OpenAPI.Parameter.Context {
        .header(required: Self.required)
    }
}
