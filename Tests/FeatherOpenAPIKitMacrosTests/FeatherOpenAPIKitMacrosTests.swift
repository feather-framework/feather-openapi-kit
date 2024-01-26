//
//  File.swift
//
//
//  Created by Tibor Bodecs on 26/01/2024.
//

import XCTest
import FeatherOpenAPIKit
import FeatherOpenAPIKitMacros

final class FeatherOpenAPIKitMacrosTests: XCTestCase {

    func testExample() {
        enum TopLevel {
            @ComponentCollection
            enum Schemas {
                enum Bar: TextSchema {
                    static let description = ""
                    static let examples = ["bar"]
                }
            }
        }
        XCTAssertFalse(TopLevel.schemas.isEmpty)
    }
}
