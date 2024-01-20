//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public extension JSONSchema {

    static func object(
        format: JSONTypeFormat.ObjectFormat = .unspecified,
        required: Bool = true,
        nullable: Bool = false,
        permissions: Permissions? = nil,
        deprecated: Bool? = nil,
        title: String? = nil,
        description: String? = nil,
        discriminator: OpenAPI.Discriminator? = nil,
        externalDocs: OpenAPI.ExternalDocumentation? = nil,
        minProperties: Int? = nil,
        maxProperties: Int? = nil,
        schemas: [Either<FeatherOpenAPIKit.Schema, OrderedDictionary<String, JSONSchema>>],
        additionalProperties: Either<Bool, JSONSchema>? = nil,
        allowedValues: [AnyCodable]? = nil,
        defaultValue: AnyCodable? = nil,
        examples: [AnyCodable] = []
    ) -> JSONSchema {
        .object(
            format: format,
            required: required,
            nullable: nullable,
            permissions: permissions,
            deprecated: deprecated,
            title: title,
            description: description,
            discriminator: discriminator,
            externalDocs: externalDocs,
            minProperties: minProperties,
            maxProperties: maxProperties,
            properties: schemas.reduce(into: .init()) {
                switch $1 {
                case .a(let schema):
                    $0[schema.id] = schema.openAPISchema()
                case .b(let dict):
                    for key in dict.keys {
                        $0[key] = dict[key]
                    }
                }
            },
            additionalProperties: additionalProperties,
            allowedValues: allowedValues,
            defaultValue: defaultValue,
            examples: examples
        )
    }
}
