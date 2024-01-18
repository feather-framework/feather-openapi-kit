//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import Foundation
import OpenAPIKit

extension Generic {

    public enum Fields {

        public static func errorCode(
            description: String = ""
        ) -> JSONSchema {
            .integer(
                required: true,
                description: description,
                maximum: (255, exclusive: false),
                minimum: (0, exclusive: false),
                examples: [0]
            )
        }

        public static func uuid(
            description: String = "Unique identifier",
            numberOfExamples: Int = 1
        ) -> JSONSchema {
            .string(
                format: .uuid,
                required: true,
                description: description,
                examples: (0..<numberOfExamples)
                    .map { _ in
                        .init(stringLiteral: UUID().uuidString)
                    }
            )
        }

        public static func createdAt(
            description: String = "Object creation date"
        ) -> JSONSchema {
            .string(
                format: .dateTime,
                required: true,
                description: description,
                examples: ["2020-01-02T10:11:12.000Z"]
            )
        }

        public static func updatedAt(
            description: String = "Last update for the object"
        ) -> JSONSchema {
            .string(
                format: .dateTime,
                required: true,
                description: description,
                examples: ["2021-02-03T11:12:13.000Z"]
            )
        }

        // MARK: - other

        public static func sortOrder(
            defaultValue: String = "asc"
        ) -> JSONSchema {
            .string(
                required: true,
                description: "Order of the list (ascending or descending).",
                allowedValues: "asc",
                "desc",
                defaultValue: .init(defaultValue)
            )
        }

        public static func filterRelation() -> JSONSchema {
            .string(
                required: true,
                description: "The relation applied to the queries (and / or).",
                allowedValues: "and",
                "or",
                defaultValue: "and"
            )
        }

        public static func filterMethod() -> JSONSchema {
            .string(
                required: true,
                description: "The filter method (equals or like).",
                allowedValues: "equals",
                "like",
                examples: ["equals"]
            )
        }

        public static func pageOffset() -> JSONSchema {
            .integer(
                required: true,
                description: "Page offset",
                maximum: (1000, exclusive: false),
                minimum: (1, exclusive: false),
                defaultValue: 1,
                examples: [1]
            )
        }

        public static func pageLimit() -> JSONSchema {
            .integer(
                required: true,
                description: "Page limit",
                maximum: (1000, exclusive: false),
                minimum: (10, exclusive: false),
                defaultValue: 50,
                examples: [10]
            )
        }

        public static func count() -> JSONSchema {
            .integer(
                required: true,
                description: "Count",
                maximum: (1000, exclusive: false),
                minimum: (0, exclusive: false),
                defaultValue: 0,
                examples: [42]
            )
        }

    }
}
