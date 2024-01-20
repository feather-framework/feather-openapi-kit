//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension Components.Tags {
    static var foo: FooTag { .init() }
}

struct FooTag: Tag {}
