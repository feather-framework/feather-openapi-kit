//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Tag: Identifiable {
    func description() -> String
    
    func openAPITag() -> OpenAPI.Tag
}

public extension Tag {
    
    func description() -> String { "" }
    
    func openAPITag() -> OpenAPI.Tag {
        .init(name: id, description: description())
    }
}
