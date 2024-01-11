//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

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
