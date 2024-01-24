//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct FooResponse: Response {

    public func openAPIResponse() -> OpenAPI.Response {
        .init(
            description: "lorem ipsum",
            content: [
                .json: FooSchema().reference()
            ]
        )
    }
}
