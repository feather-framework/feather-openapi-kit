//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol QueryParameter: ContextParameter {}

public extension QueryParameter {
    static var context: OpenAPI.Parameter.Context { .query }
}
