//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 25/01/2024.
//

public struct OperationResponse {

    public let statusCode: Int
    public let response: Response.Type
    
    public init(
        _ statusCode: Int,
        _ response: Response.Type
    ) {
        self.statusCode = statusCode
        self.response = response
    }
}
