//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol JSONResponse: Response {
    static var description: String { get }
    static var schema: Schema.Type { get }
}

public extension JSONResponse {

    static func openAPIResponse() -> OpenAPI.Response {
        .init(
            description: description,
            content: [
                .json: schema.reference()
            ]
        )
    }
}
