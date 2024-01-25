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
    static let fields: [Field.Type] = [
        Fields.Id.self,
        Fields.Key.self,
    ]
    
    enum Fields {
        
        struct Id: UUIDField {
            static let description = "Unique system variable identifier"
        }
        
        struct Key: TextField {
            static let description = "Key of the system variable"
            static let examples = [
                "systemEmailAddress",
            ]
        }
    }
}
