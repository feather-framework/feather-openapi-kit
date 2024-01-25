//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension Example.Model {

    @ComponentCollection
    enum Responses {

        struct Detail: JSONResponse {
            static let description = "Example"
            static let content: OpenAPI.Content = Schemas.Detail.reference()
        }
    }
}
