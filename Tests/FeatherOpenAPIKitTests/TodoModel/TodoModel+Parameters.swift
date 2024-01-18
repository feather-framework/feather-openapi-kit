//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import Foundation
import FeatherOpenAPIKit
import OpenAPIKit

extension TodoModel {

    enum Parameters {

        static var id: OpenAPI.Parameter {
            .init(
                name: "todoId",
                context: .path,
                schema: Generic.Fields.uuid(numberOfExamples: 10)
            )
        }
    }
}
