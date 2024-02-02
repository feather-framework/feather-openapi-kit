import FeatherOpenAPIKit
import FeatherOpenAPIKitMacros

enum TopLevelTest {
    @ComponentCollection(["AA"])
    enum Schemas {
        enum Foo {
            enum Bar: TextSchema {
                enum empty {
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
