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

        //        test()
        //        return

        let document = ExampleDocument()
        let encoder = YAMLEncoder()
        let openAPIDocument = document.openAPIDocument()
        do {
            _ = try openAPIDocument.locallyDereferenced()
        }
        catch {
            return XCTFail("\(error)")
        }
        let yaml = try encoder.encode(openAPIDocument)

        let basePath = #file
            .split(separator: "/")
            .dropLast(3)
            .joined(separator: "/")

        let paths = [
            "/\(basePath)/OpenAPI/openapi.yaml"

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
        //        let document = ExampleDocument()
        //        let openAPIDocument = document.openAPIDocument()
        //
        //        for component in document.components {
        //            for object in component.schemas where !(object is Field) {
        //                print("object", object.id)
        //                for (k, v) in object.openAPISchema().objectContext?.properties ?? [:] {
        //
        //                    var fieldString = "let \(k): "
        //
        //                    switch v.value {
        //                    case let .reference(schema, ctx):
        //                        let typeDef = try! schema._dereferenced(
        //                            in: openAPIDocument.components,
        //                            following: .init(),
        //                            dereferencedFromComponentNamed: k
        //                        )
        //                        switch typeDef.value {
        //                        case .string(_, _):
        //                            fieldString += "String"
        //                        default:
        //                            break
        //                        }
        //                        fieldString += ctx.required ? "" : "?"
        //                    default:
        //                        break
        //                    }
        //
        //                    print(fieldString)
        //
        //                    print("----")
        //                }
        //            }
        //            print("------------")
        //        }
    }

    func testGenerateSwiftCode2() throws {
        //        let document = ExampleDocument()
        //        let openAPI = document.openAPIDocument()
        //
        //        print(try! openAPI.locallyDereferenced())
    }
}
