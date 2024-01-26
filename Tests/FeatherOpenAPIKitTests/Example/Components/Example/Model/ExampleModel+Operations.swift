//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

extension Example.Model {

    static let operations: [Operation.Type] = [
        Operations.Get.self,
        Operations.Create.self,
    ]
    
    enum Operations {

        enum Get: Operation {
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Detail example"
            static let description = "Detail example detail"
//            static var parameters: [Parameter.Type] = [
//                Parameters.Id.self,
//            ]
            static let responses: [OperationResponse] = [
                .init(200, Responses.Detail.self),
            ]
        }

        enum Create: Operation {
            static let tag: Tag.Type = Tags.Main.self
            static let summary = "Create example"
            static let description = "Create example detail"
            static var requestBody: RequestBody.Type? = RequestBodies.Create.self
            static let responses: [OperationResponse] = [
                .init(200, Responses.Detail.self),
            ]
            static let security: [SecurityScheme.Type] = [
                SecuritySchemes.BearerToken.self,
            ]
        }

    }
}
