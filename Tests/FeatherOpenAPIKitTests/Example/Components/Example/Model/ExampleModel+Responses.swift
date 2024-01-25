//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension Example.Model {
    
    // TODO: macro generated code
    static let responses: [Response.Type] = [
        Responses.Detail.self,
    ]
    
    enum Responses {

        struct Detail: JSONResponse {
            static let description = "Example"
            static let content: OpenAPI.Content = Schemas.Detail.reference()
        }
    }
}

