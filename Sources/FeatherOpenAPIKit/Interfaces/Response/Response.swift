//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Response: Identifiable {
    static func openAPIResponse() -> OpenAPI.Response
}

public extension Response {

    static func reference() -> Either<
        OpenAPI.Reference<OpenAPI.Response>, OpenAPI.Response
    > {
        .reference(.component(named: id))
    }
}
