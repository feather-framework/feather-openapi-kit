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
    enum Fields {

        struct Id: UUIDField {
            static let description = "Unique system variable identifier"
        }

        struct Key: TextField {
            static let description = "Key of the system variable"
            static let examples = [
                "systemEmailAddress"
            ]
        }
    }
}
