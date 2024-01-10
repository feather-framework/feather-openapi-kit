//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit

public extension OpenAPI.ComponentDictionary {

    static func + (lhs: Self, rhs: Self) -> Self {
        var result = lhs
        for key in rhs.keys {
            result[key] = rhs[key]
        }
        return result
    }
}
