//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKit
import OpenAPIKitCore

public struct OpenAPIDocumentComposer {

    let documentComponents: [OpenAPIDocumentComponent]

    public init(_ documentComponents: [OpenAPIDocumentComponent]) {
        self.documentComponents = documentComponents
    }
}

extension OpenAPIDocumentComposer: OpenAPIDocumentComponent {

    public func tags() -> [OpenAPI.Tag] {
        documentComponents.reduce([], { $0 + $1.tags() })
    }

    public func paths() -> OpenAPI.PathItem.Map {
        documentComponents.reduce([:], { $0 + $1.paths() })
    }

    public func components() -> OpenAPI.ComponentDictionary<JSONSchema> {
        documentComponents.reduce([:], { $0 + $1.components() })
    }

    public func parameters() -> OpenAPI.ComponentDictionary<OpenAPI.Parameter> {
        documentComponents.reduce([:], { $0 + $1.parameters() })
    }
}
