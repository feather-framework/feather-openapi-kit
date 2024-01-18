//
//  FeatherOpenAPIKitTests.swift
//  FeatherOpenAPIKitTests
//
//  Created by Tibor Bödecs on 2023. 01. 16..
//

import XCTest
import FeatherOpenAPIKit
import OpenAPIKit
import Yams

final class FeatherOpenAPIKitTests: XCTestCase {

    func testDocumentGeneration() async throws {
        let doc = OpenAPI.Document.definition
        let encoder = YAMLEncoder()
        let yaml = try encoder.encode(doc)

        let basePath = #file
            .split(separator: "/")
            .dropLast(1)
            .joined(separator: "/")

        let path = "/\(basePath)/openapi.yaml"
        print(path)

        try yaml.write(
            to: URL(fileURLWithPath: path),
            atomically: true,
            encoding: .utf8
        )
    }
}
