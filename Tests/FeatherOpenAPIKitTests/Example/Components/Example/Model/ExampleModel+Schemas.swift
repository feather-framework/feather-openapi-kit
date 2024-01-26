//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

extension Example.Model {

    static let schemas: [Schema.Type] = [
        Schemas.Id.self,
        Schemas.Key.self,
        Schemas.Create.self,
        Schemas.Detail.self,
        Schemas.List.self,
        Schemas.List.Item.self,
    ]
    
    enum Schemas {

        enum Id: UUIDSchema {
            static let description = "Unique example model identifier"
        }

        enum Key: TextSchema {
            static let description = "Key of the example model"
            static let examples = [
                "my-example-key",
            ]
        }

        enum Create: ObjectSchema {
            static let description = "example model create object"
            static let properties: [ObjectSchemaProperty] = [
                .init("key", Key.self),
                .init("key", Key.self),
            ]
        }

        enum Detail: ObjectSchema {
            static let description = "example model detail object"

            static let properties: [ObjectSchemaProperty] = [
                .init("id", Id.self),
                .init("key", Key.self),
            ]
        }
        
        enum List: ArraySchema {

            enum Item: ObjectSchema {
                static let description = "example model detail object"

                static let properties: [ObjectSchemaProperty] = [
                    .init("id", Id.self),
                    .init("key", Key.self),
                ]
            }
            
            static let description = "Lorem ipsum dolor sit amet"
            static let items: Schema.Type = Item.self
        }
    }
}
