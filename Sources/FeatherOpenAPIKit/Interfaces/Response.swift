//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Response: Identifiable {
    func openAPIResponse() -> OpenAPI.Response
}

public extension Response {

    func reference() -> Either<
        OpenAPI.Reference<OpenAPI.Response>, OpenAPI.Response
    > {
        .reference(.component(named: id))
    }
}
