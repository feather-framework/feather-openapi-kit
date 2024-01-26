//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol OpenAPIResponse: Identifiable {
    static func openAPIResponse() -> OpenAPI.Response
}

public extension OpenAPIResponse {

    static func reference() -> Either<
        OpenAPI.Reference<OpenAPI.Response>,
        OpenAPI.Response
    > {
        .reference(.component(named: id))
    }
}

public protocol Response: OpenAPIResponse {

}

public extension Response {

}
