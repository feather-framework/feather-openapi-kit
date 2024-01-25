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
    static let schemas: [Schema.Type] = [
        Schemas.Create.self,
        Schemas.Detail.self,
    ]
    
    enum Schemas {
        
        struct Create: Schema {
            
            static func openAPISchema() -> JSONSchema {
                .object(
                    properties: [
                        "key": Fields.Key.reference(),
                    ]
                )
            }
        }
        
        struct Detail: Schema {
            
            static func openAPISchema() -> JSONSchema {
                .object(
                    properties: [
                        "id": Fields.Id.reference(),
                        "key": Fields.Key.reference(),
                    ]
                )
            }
        }
    }
}