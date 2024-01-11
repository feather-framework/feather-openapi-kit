//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit

public extension OpenAPI.Content {

    static func ref(_ name: String) -> Self {
        .init(schemaReference: .component(named: name))
    }
}

public extension JSONSchema {

    static func ref(_ name: String) -> JSONSchema {
        reference(.component(named: name))
    }
}

public extension Either<OpenAPI.Reference<OpenAPI.Parameter>, OpenAPI.Parameter>
{

    static func ref(_ name: String) -> Self {
        reference(.component(named: name))
    }
}

public extension Either<OpenAPI.Reference<OpenAPI.Response>, OpenAPI.Response> {

    static func ref(_ name: String) -> Self {
        reference(.component(named: name))
    }
}
