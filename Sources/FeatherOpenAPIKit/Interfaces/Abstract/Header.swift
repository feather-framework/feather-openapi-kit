//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Header: Identifiable {
    
    func openAPIHeader() -> OpenAPI.Header
}

public extension Header {

    func reference() -> OpenAPI.Header {
        fatalError()
    }
}
