import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import FeatherOpenAPIKitMacrosKit

final class FeatherOpenAPIKitMacrosTests: XCTestCase {

    let testMacros: [String: Macro.Type] = [
        "ComponentCollection": ComponentCollectionMacro.self,
        "ComponentCollectionLevel_1": ComponentCollectionLevel_1.self,
        "ComponentCollectionLevel_2": ComponentCollectionLevel_2.self,
        "ComponentCollectionLevel_3": ComponentCollectionLevel_3.self,
        "ComponentCollectionLevel_4": ComponentCollectionLevel_4.self,
        "ComponentCollectionLevel_5": ComponentCollectionLevel_5.self,
    ]

    func testProtoMacro() {
        //TODO: make test
        assertMacroExpansion(
            """
            import FeatherOpenAPIKit
            import OpenAPIKit

            extension Example.Model {
                @ComponentCollection
                enum Schemas {
                    enum empty {
                    }

                    enum Id: UUIDSchema {
                        static let description = "Unique example model identifier"
                    }
                    
                    enum Key {
                        enum InsdierKey: TextSchema {
                            enum InsdierKeyLevel3: TextSchema {
                                enum InsdierKeyLevel4 {
                                    enum InsdierKeyLevel5: TextSchema {
                                    }
                                }
                            }
                            static let description = "Key of the example model"
                            static let examples = [
                                "my-example-key",
                            ]
                        }

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
                        enum empty {

                            static let schemas : [Schema.Type] = [

                              ]
                        }

                        enum Id: UUIDSchema {
                            static let description = "Unique example model identifier"

                            static let schemas : [Schema.Type] = [

                              ]
                        }
                        
                        enum Key {
                            enum InsdierKey: TextSchema {
                                enum InsdierKeyLevel3: TextSchema {
                                    enum InsdierKeyLevel4 {
                                        enum InsdierKeyLevel5: TextSchema {

                                            static let schemas : [Schema.Type] = [

                                              ]
                                        }

                                        static let schemas : [Schema.Type] = [
                                                    InsdierKeyLevel5.self,

                                          ]
                                             + InsdierKeyLevel5.schemas
                                    }

                                    static let schemas : [Schema.Type] = [

                                      ]
                                         + InsdierKeyLevel4.schemas
                                }
                                static let description = "Key of the example model"
                                static let examples = [
                                    "my-example-key",
                                ]

                                static let schemas : [Schema.Type] = [
                                            InsdierKeyLevel3.self,

                                  ]
                                     + InsdierKeyLevel3.schemas
                            }

                            static let description = "Key of the example model"
                            static let examples = [
                                "my-example-key",
                            ]

                            static let schemas : [Schema.Type] = [
                                        InsdierKey.self,

                              ]
                                 + InsdierKey.schemas
                        }
                    }

                    static let schemas : [Schema.Type] = [
                                Schemas.Id.self,

                      ]
                         + Schemas.empty.schemas
                     + Schemas.Id.schemas
                     + Schemas.Key.schemas
                }
                """,
            macros: testMacros
        )
    }
}
