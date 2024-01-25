//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 25/01/2024.
//

import OpenAPIKit

public protocol Operation: Identifiable {
    static var operationId: String { get }

    static func openAPIOperation() -> OpenAPI.Operation
}

public extension FeatherOpenAPIKit.Operation {

    static var operationId: String {
        String(reflecting: Self.self)
            .split(separator: ".")
            .reversed()
            .joined(separator: "")
    }
}
