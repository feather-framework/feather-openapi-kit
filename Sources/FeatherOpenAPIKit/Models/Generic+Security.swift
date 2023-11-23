import Foundation
import OpenAPIKit

extension Generic {

    public enum Security {

        public static let bearerAuth: [OpenAPI.SecurityRequirement] = [
            [
                .component(named: "bearerAuth"): []
            ]
        ]
    }
}
