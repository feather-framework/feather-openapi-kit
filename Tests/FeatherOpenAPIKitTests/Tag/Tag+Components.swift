import Foundation
import FeatherOpenAPIKit
import OpenAPIKit

extension Tag {

    enum Components {

        static var reference: JSONSchema {
            .object(
                properties: [
                    "id": Fields.id(),
                    "name": Fields.name(),
                ]
            )
        }

        static var listItem: JSONSchema {
            .object(
                properties: [
                    "id": Fields.id(),
                    "name": Fields.name(),
                ]
            )
        }

        static var listSortBy: JSONSchema {
            .enumeration(
                description: "The sort key for the list",
                allowedValues: ["name"],
                defaultValue: "name"
            )
        }

        static var listFilterKey: JSONSchema {
            .enumeration(
                description: "The sort key for the list",
                allowedValues: ["name"],
                examples: ["name"]
            )
        }

        static var detail: JSONSchema {
            .object(
                properties: [
                    "id": Fields.id(),
                    "name": Fields.name(),
                ]
            )
        }

        static var create: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name()
                ]
            )
        }

        static var update: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name()
                ]
            )
        }

        static var patch: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name(required: false)
                ]
            )
        }
    }

}
