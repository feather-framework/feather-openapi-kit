//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension TodoModel {

    enum Fields {

        static func id(
            description: String = "Unique identifier"
        ) -> JSONSchema {
            .string(
                format: .uuid,
                required: true,
                description: description,
                examples: [
                    "7B8154FE-C507-4810-8EAF-5AB30B90EC89"
                ]
            )
        }

        static func name(
            required: Bool = true
        ) -> JSONSchema {
            .string(
                format: .generic,
                required: required,
                description: """
                    Name of the todo item

                    Validation rules:
                    - required: true
                    - min length: 2
                    - max length: 128
                    - unique
                    """,
                minLength: 2,
                maxLength: 128,
                examples: [
                    "Development"
                ]
            )
        }
    }
}
