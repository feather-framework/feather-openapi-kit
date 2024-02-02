import FeatherOpenAPIKit
import FeatherOpenAPIKitMacros

@ComponentCollectionExtension("AA")
extension TopLevelTest.Schemas {
    enum AA : TextSchema {
        static let description = ""
        static let examples = ["baz"]
    }
}
