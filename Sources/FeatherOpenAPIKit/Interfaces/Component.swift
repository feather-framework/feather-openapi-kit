//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

public protocol Component {

    //    static var examples: [Example] { get }
    static var fields: [Field.Type] { get }
    static var schemas: [Schema.Type] { get }

    static var parameters: [Parameter.Type] { get }
    static var headers: [Header.Type] { get }
    static var requestBodies: [RequestBody.Type] { get }
    static var securitySchemes: [SecurityScheme.Type] { get }

    static var responses: [Response.Type] { get }

    static var tags: [Tag.Type] { get }
    static var operations: [Operation.Type] { get }
    static var pathItems: [PathItem.Type] { get }

}

public extension Component {

    //    static var examples: [Example] { [] }
    static var fields: [Field.Type] { [] }
    static var schemas: [Schema.Type] { [] }

    static var parameters: [Parameter.Type] { [] }
    static var headers: [Header.Type] { [] }
    static var requestBodies: [RequestBody.Type] { [] }
    static var securitySchemes: [SecurityScheme.Type] { [] }

    static var responses: [Response.Type] { [] }

    static var tags: [Tag.Type] { [] }
    static var operations: [Operation.Type] { [] }
    static var pathItems: [PathItem.Type] { [] }
}
