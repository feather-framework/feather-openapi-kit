//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

public protocol Component {

    // NOTE: no support for examples yet in OpeAPIKit
    // static var examples: [Example.Type] { get }
    static var schemas: [Schema.Type] { get }

    static var parameters: [Parameter.Type] { get }
    static var headers: [Header.Type] { get }
    static var requestBodies: [RequestBody.Type] { get }
    static var securitySchemes: [SecurityScheme.Type] { get }

    static var responses: [Response.Type] { get }

    static var tags: [Tag.Type] { get }
    static var operations: [Operation.Type] { get }
    static var pathItems: [PathItem.Type] { get }
    
    static func getClassByType<T>() -> [T]
}

public extension Component {    
    static var schemas: [Schema.Type] { getClassByType() }
    static var parameters: [Parameter.Type] { getClassByType() }
    static var headers: [Header.Type] { getClassByType() }
    static var requestBodies: [RequestBody.Type] { getClassByType() }
    static var securitySchemes: [SecurityScheme.Type] { getClassByType() }
    static var responses: [Response.Type] { getClassByType() }
    static var tags: [Tag.Type] { getClassByType() }
    static var operations: [FeatherOpenAPIKit.Operation.Type] { getClassByType() }
    static var pathItems: [PathItem.Type] { getClassByType() }
}
