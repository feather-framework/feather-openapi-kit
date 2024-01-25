//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension Example.Model {

    static let responses: [Response.Type] = [
        Responses.Detail.self,
    ]

    enum Responses {

        enum Detail: JSONResponse {
            static let description = "Example"
            static let schema: Schema.Type = Schemas.Detail.self
        }
    }
}
