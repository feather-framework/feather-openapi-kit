//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

public struct ExamplePathItem: PathItem {

    public let id = "/example/{exampleId}"

    public func openAPIPathItem() -> OpenAPI.PathItem {
        .init(
            summary: "path summary",
            description: "path description",
            parameters: [
                ExampleParameter().reference()
            ],
            get: ExampleOperation().openAPIOperation()
        )
    }
}
