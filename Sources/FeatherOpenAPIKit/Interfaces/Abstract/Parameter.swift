//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol Parameter: Identifiable {
    func openAPIParameter() -> OpenAPI.Parameter
}



public extension Parameter {
    
    func reference() -> Either<OpenAPI.Reference<OpenAPI.Parameter>, OpenAPI.Parameter> {
        .reference(.component(named: id))
    }
}
