import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import FeatherOpenAPIKitMacrosKit

final class FeatherOpenAPIKitMacrosTests: XCTestCase {

    let testMacros: [String: Macro.Type] = [
        "ComponentCollection": ComponentCollectionMacro.self,
        "ComponentCollectionExtension": ComponentCollectionExtensionMacro.self,
    ]

    func testProtoMacro() {
        assertMacroExpansion(
            """
            import FeatherOpenAPIKit
            import OpenAPIKit

            extension Example.Model {
                @ComponentCollection(["first_member"])
                enum Schemas {
                    enum empty {
                    }

                    enum Id: UUIDSchema {
                        static let description = "Unique example model identifier"
                    }
                    
                    enum Key {
                        enum InsiderKey: TextSchema {
                            enum InsiderKeyLevel3: TextSchema {
                                enum InsiderKeyLevel4 {
                                    enum InsiderKeyLevel5: TextSchema {
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
                        }

                        enum Id: UUIDSchema {
                            static let description = "Unique example model identifier"
                        }
                        
                        enum Key {
                            enum InsiderKey: TextSchema {
                                enum InsiderKeyLevel3: TextSchema {
                                    enum InsiderKeyLevel4 {
                                        enum InsiderKeyLevel5: TextSchema {
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

                    public static let schemas : [Schema.Type] = [
                                Schemas.Id.self,
                          Schemas.Key.InsiderKey.InsiderKeyLevel3.InsiderKeyLevel4.InsiderKeyLevel5.self,
                          Schemas.Key.InsiderKey.InsiderKeyLevel3.self,
                          Schemas.Key.InsiderKey.self
                      ] + Schemas.first_memberSchemas
                }
                """,
            macros: testMacros
        )
    }
    
    func testProtoExtensionMacro() {
        assertMacroExpansion(
            """
            import FeatherOpenAPIKit
            import OpenAPIKit

            @ComponentCollectionExtension("first_member")
            extension Example.Model.Schemas {
                enum FirstLevel: Schema {
                    enum empty {
                    }

                    enum Id: UUIDSchema {
                        static let description = "Unique example model identifier"
                    }
                    
                    enum Key {
                        enum InsiderKey: TextSchema {
                            enum InsiderKeyLevel3: TextSchema {
                                enum InsiderKeyLevel4 {
                                    enum InsiderKeyLevel5: TextSchema {
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
                extension Example.Model.Schemas {
                    enum FirstLevel: Schema {
                        enum empty {
                        }

                        enum Id: UUIDSchema {
                            static let description = "Unique example model identifier"
                        }
                        
                        enum Key {
                            enum InsiderKey: TextSchema {
                                enum InsiderKeyLevel3: TextSchema {
                                    enum InsiderKeyLevel4 {
                                        enum InsiderKeyLevel5: TextSchema {
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

                    public static let first_memberSchemas : [Schema.Type] = [
                                FirstLevel.Id.self,
                          FirstLevel.Key.InsiderKey.InsiderKeyLevel3.InsiderKeyLevel4.InsiderKeyLevel5.self,
                          FirstLevel.Key.InsiderKey.InsiderKeyLevel3.self,
                          FirstLevel.Key.InsiderKey.self,
                          FirstLevel.self
                      ]
                }
                """,
            macros: testMacros
        )
    }

}
