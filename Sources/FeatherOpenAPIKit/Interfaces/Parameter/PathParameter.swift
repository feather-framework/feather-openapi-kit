//
//  File.swift
//
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol PathParameter: ContextParameter {}

public extension PathParameter {
    static var context: OpenAPI.Parameter.Context { .path }
}
