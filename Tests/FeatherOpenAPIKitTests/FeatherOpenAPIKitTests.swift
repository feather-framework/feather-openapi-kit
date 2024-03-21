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
        let openAPIDocument = try document.openAPIDocument()
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

    func testDuplicatedItem() throws {

        let document = ExampleDuplicatedItemDocument()
        var errorMessage: String = "none"

        do {
            let _ = try document.openAPIDocument()
        }
        catch let error as ComposeDocumentError {
            errorMessage = error.message
        }

        XCTAssertEqual(
            errorMessage,
            "Feather OpenAPI item id is duplicated: 'ExampleDuplicatedItemModelKey' (Did you forget to include override=true?)"
        )
    }

    func testMissingParentItem() throws {

        let document = ExampleMissingParentItemItemDocument()
        var errorMessage: String = "none"

        do {
            let _ = try document.openAPIDocument()
        }
        catch let error as ComposeDocumentError {
            errorMessage = error.message
        }

        XCTAssertEqual(
            errorMessage,
            "Feather OpenAPI item 'ExampleMissingParentItemModelKey' is set as override but has no parent. (Components order is ok?)"
        )
    }

}
