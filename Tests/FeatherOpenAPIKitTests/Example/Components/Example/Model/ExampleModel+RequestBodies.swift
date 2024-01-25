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
    enum RequestBodies {

        struct Create: JSONBody {
            static let description = "Create example"
            static let content: OpenAPI.Content = Schemas.Create.reference()
        }
    }
}
