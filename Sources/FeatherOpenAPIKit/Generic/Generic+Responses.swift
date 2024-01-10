//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit

extension Generic {

    public enum Responses {

        public static func error(_ description: String) -> OpenAPI.Response {
            .init(
                description: description,
                content: [
                    .json: .init(
                        schema: .reference(
                            .component(named: "GenericErrorResponse")
                        )
                    )
                ]
            )
        }
    }
}
