//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol JSONBody: RequestBody {
    static var description: String { get }
    static var content: OpenAPI.Content { get }
    static var required: Bool { get }
}

public extension JSONBody {
    static var required: Bool { true }

    static func openAPIRequestBody() -> OpenAPI.Request {
        .init(
            description: description,
            content: [
                .json: content
            ],
            required: true
        )
    }
}
