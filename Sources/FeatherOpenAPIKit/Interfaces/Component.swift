//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

public protocol Component {

    //    var examples: [Example] { get }
    var fields: [Field] { get }
    var schemas: [Schema] { get }

    var parameters: [Parameter] { get }
    var headers: [Header] { get }
    var requestBodies: [RequestBody] { get }
    var securitySchemes: [SecurityScheme] { get }

    var responses: [Response] { get }

    var tags: [Tag] { get }
    var operations: [Operation] { get }
    var pathItems: [PathItem] { get }

}

public extension Component {

    //    var examples: [Example] { [] }
    var fields: [Field] { [] }
    var schemas: [Schema] { [] }

    var parameters: [Parameter] { [] }
    var headers: [Header] { [] }
    var requestBodies: [RequestBody] { [] }
    var securitySchemes: [SecurityScheme] { [] }

    var responses: [Response] { [] }

    var tags: [Tag] { [] }
    var operations: [Operation] { [] }
    var pathItems: [PathItem] { [] }
}
