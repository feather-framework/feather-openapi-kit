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
    static let parameters: [Parameter.Type] = [
        Parameters.Id.self,
    ]
    
    enum Parameters {
        
        struct Id: PathParameter {
            static let name = "id"
            static let description = "Example parameter"
            static let schema: JSONSchema = Fields.Id.reference()
        }
    }
}
