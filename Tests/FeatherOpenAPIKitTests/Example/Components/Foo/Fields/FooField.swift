//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct FooField: Field {

    public init() {

    }

    public func openAPISchema() -> OpenAPIKit.JSONSchema {
        .string()
    }
}
