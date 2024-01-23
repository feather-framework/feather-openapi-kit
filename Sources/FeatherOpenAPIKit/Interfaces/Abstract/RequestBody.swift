//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import OpenAPIKit

public protocol RequestBody: Identifiable {
    func openAPIRequestBody() -> OpenAPI.Request
}
