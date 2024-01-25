import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(FeatherOpenAPIKitMacro)
import FeatherOpenAPIKitMacro

let FeatherOpenAPIKitMacros: [String: Macro.Type] = [
    "ComponentCollection": ComponentCollection.self
]
#endif

final class FeatherOpenAPIKitMacroTests: XCTestCase {
    func testProtoMacro() {
        //TODO: make test
        assertMacroExpansion(
            """
            import FeatherOpenAPIKit
            import OpenAPIKit

            extension Example.Model {
                @ComponentCollection
                enum Fields {
                    
                    struct Id: UUIDField {
                        static let description = "Unique system variable identifier"
                    }
                    
                    struct Key: TextField {
                        static let description = "Key of the system variable"
                        static let examples = [
                            "systemEmailAddress",
                        ]
                    }
                }
            }
            """,
            expandedSource: """
                import FeatherOpenAPIKit
                import OpenAPIKit

                extension Example.Model {
                    enum Fields {
                        
                        struct Id: UUIDField {
                            static let description = "Unique system variable identifier"
                        }
                        
                        struct Key: TextField {
                            static let description = "Key of the system variable"
                            static let examples = [
                                "systemEmailAddress",
                            ]
                        }
                    }

                    static let fields : [Field.Type] = [
                                Fields.Id.self,
                          Fields.Key.self
                      ]
                }
                """,
            macros: FeatherOpenAPIKitMacros
        )

    }

}
