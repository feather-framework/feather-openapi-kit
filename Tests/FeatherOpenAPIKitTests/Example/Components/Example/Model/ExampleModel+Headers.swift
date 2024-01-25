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
    static let headers: [Header.Type] = [
        Headers.Custom.self,
    ]

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
