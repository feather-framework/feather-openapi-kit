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
        let openAPIDocument = document.openAPIDocument()
        do {
            _ = try openAPIDocument.locallyDereferenced()
        }
        catch {
            return XCTFail("\(error)")
        }

        _ = try encoder.encode(openAPIDocument)
    }

    func testSchemaDescription() throws {

        struct IDSchema: NanoIDSchema {}
        struct Foo: NanoIDSchema {}

        XCTAssertEqual(IDSchema.description, "ID description")
        XCTAssertEqual(Foo.description, "Foo description")
    }
}
