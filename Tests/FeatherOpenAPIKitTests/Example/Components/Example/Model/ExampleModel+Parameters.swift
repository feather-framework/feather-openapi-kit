//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

extension Example.Model {

    static let parameters: [Parameter.Type] = [
        Parameters.Id.self,
    ]

    enum Parameters {

        enum Id: PathParameter {
            static let name = "id"
            static let description = "Example parameter"
            static let schema: Schema.Type = Schemas.Id.self
        }
    }
}
