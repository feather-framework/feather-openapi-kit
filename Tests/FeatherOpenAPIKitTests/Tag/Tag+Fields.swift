import Foundation
import FeatherOpenAPIKit
import OpenAPIKit

extension Tag {

    enum Fields {

        static func id(description: String = "Unique identifier") -> JSONSchema
        {
            .string(
                format: .uuid,
                required: true,
                description: description,
                examples: ["7B8154FE-C507-4810-8EAF-5AB30B90EC89"]
            )
        }

        static func name(required: Bool = true) -> JSONSchema {
            .string(
                format: .generic,
                required: required,
                description: """
                    Name of the tag

                    Validation rules:
                    - required: true
                    - min length: 2
                    - max length: 128
                    - unique
                    """,
                minLength: 2,
                maxLength: 128,
                examples: ["Development"]
            )
        }
    }
}
