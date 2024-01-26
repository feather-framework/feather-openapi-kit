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
                enum Foo {
                    enum Bar: TextSchema {
                        enum empty {
                            //TODO: it seems empty enum is sucks for MemberMacro (except in test :P) ...
                            //  it will solve by the tree iterator version in the furure
                            case member
                        }

                        enum Baz: TextSchema {
                            static let description = ""
                            static let examples = ["baz"]
                        }
                        static let description = ""
                        static let examples = ["bar"]
                    }
                }
            }
        }

        XCTAssert(TopLevel.schemas.count == 2)
        //wtf??? why does not work this test properly? (when I change it for 3 it will not produce error)
        //        XCTAssertEqual(TopLevel.schemas.count, 3)
    }
}
