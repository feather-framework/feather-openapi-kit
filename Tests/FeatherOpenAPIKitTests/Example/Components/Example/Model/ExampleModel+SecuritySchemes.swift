//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit
import OpenAPIKit

extension Operation {

    static func bearerToken() -> [OpenAPI.SecurityRequirement] {
        Example.Model.SecuritySchemes.BearerToken.reference()
    }
}

extension Example.Model {
    
    // TODO: macro generated code
    static let securitySchemes: [SecurityScheme.Type] = [
        SecuritySchemes.BearerToken.self,
    ]
    
    enum SecuritySchemes {
        
        struct BearerToken: SecurityScheme {
            
            static func openAPISecurityScheme() -> OpenAPI.SecurityScheme {
                .init(
                    type: .http(
                        scheme: "bearer",
                        bearerFormat: "token"
                    ),
                    description: "Authorization header using a Bearer token"
                )
            }
        }
    }
}
