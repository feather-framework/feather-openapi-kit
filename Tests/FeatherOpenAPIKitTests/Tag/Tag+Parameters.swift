import Foundation
import FeatherOpenAPIKit
import OpenAPIKit

extension Tag {

    enum Parameters {

        static var id: OpenAPI.Parameter {
            .init(
                name: "tagId",
                context: .path,
                schema: Fields.id()
            )
        }
    }
}
