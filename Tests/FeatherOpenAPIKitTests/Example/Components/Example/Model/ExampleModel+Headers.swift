//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

extension Example.Model {

    static let headers: [Header.Type] = [
        Headers.Custom.self,
    ]

    enum Headers {

        enum Custom: Header {
            static let key = "X-Custom-Header"
            static let title = "Custom header"
            static let description: String = "Custom header description"
        }
    }
}
