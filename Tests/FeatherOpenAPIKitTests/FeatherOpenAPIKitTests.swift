//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import Foundation
import OpenAPIKit
import OpenAPIKitCore
import Yams
import XCTest

@testable import FeatherOpenAPIKit

final class FeatherOpenAPIKitTests: XCTestCase {
    
    func testRender() throws {
        
        let document = ExampleDocument()
        
        let encoder = YAMLEncoder()
        let yaml = try encoder.encode(document.openAPIDocument())
        
        let basePath = #file
            .split(separator: "/")
            .dropLast(3)
            .joined(separator: "/")
        
        let paths = [
            "/\(basePath)/OpenAPI/openapi.yaml",
        
        ]
        
        for path in paths {
            try yaml.write(
                to: URL(fileURLWithPath: path),
                atomically: true,
                encoding: .utf8
            )
        }

        //
        print("\(yaml)")
    }
    
    func testGenerateSwiftCode() throws {        
        let document = ExampleDocument()

        for component in document.components {
            for object in component.schemas where !(object is Field) {
                print(object.id)
                for (k, v) in object.openAPISchema().objectContext?.properties ?? [:] {
                    print(k, v.isReference)
                }
            }
        }
    }
}
