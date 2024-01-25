//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension Example.Model {

    static let requestBodies: [RequestBody.Type] = [
        RequestBodies.Create.self,
    ]

    enum RequestBodies {

        enum Create: JSONBody {
            static let description = "Create example"
            static let schema: Schema.Type = Schemas.Create.self
        }
    }
}
