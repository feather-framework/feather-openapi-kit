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
    static let pathItems: [PathItem.Type] = [
        PathItems.Main.self,
        PathItems.Identified.self,
    ]
    
    enum PathItems {

        struct Main: PathItem {            
            static let id = "/example/models"

            static func openAPIPathItem() -> OpenAPI.PathItem {
                .init(
                    post: Operations.Create.openAPIOperation()
                )
            }
        }

        struct Identified: PathItem {
            static let id = "\(Main.id)/{\(Parameters.Id.name)}"

            static func openAPIPathItem() -> OpenAPI.PathItem {
                .init(
//                    summary: "path summary",
//                    description: "path description",
                    parameters: [
                        Parameters.Id.reference()
                    ],
                    get: Operations.Get.openAPIOperation()
                )
            }
        }

    }
}
