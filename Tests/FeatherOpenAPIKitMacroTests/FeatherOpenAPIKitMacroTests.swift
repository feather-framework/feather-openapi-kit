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
                enum Schemas {
                    
                    enum Id: UUIDSchema {
                        static let description = "Unique example model identifier"
                    }
                    
                    enum Key: TextSchema {
                        static let description = "Key of the example model"
                        static let examples = [
                            "my-example-key",
                        ]
                    }
                }
            }
            """,
            expandedSource: """
                import FeatherOpenAPIKit
                import OpenAPIKit

                extension Example.Model {
                    enum Schemas {
                        
                        enum Id: UUIDSchema {
                            static let description = "Unique example model identifier"
                        }
                        
                        enum Key: TextSchema {
                            static let description = "Key of the example model"
                            static let examples = [
                                "my-example-key",
                            ]
                        }
                    }

                    static let schemas : [Schema.Type] = [
                                Schemas.Id.self,
                          Schemas.Key.self
                      ]
                }
                """,
            macros: FeatherOpenAPIKitMacros
        )

    }

}
