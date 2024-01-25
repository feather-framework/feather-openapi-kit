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
    enum Headers {

        struct Custom: Header {

            static let key = "X-Custom-Header"

            static func openAPIHeader() -> OpenAPI.Header {
                .init(
                    schema: .string(
                        format: .generic,
                        title: "Custom header",
                        description: "custom header description"
                    )
                )
            }
        }

    }
}
