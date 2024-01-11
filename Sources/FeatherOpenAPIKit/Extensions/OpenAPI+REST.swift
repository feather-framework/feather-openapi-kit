//
//  File.swift
//
//
//  Created by Tibor Bodecs on 10/01/2024.
//

import OpenAPIKitCore
import OpenAPIKit

public extension OpenAPI.Request {

    static func bulkDelete() -> Self {
        .init(content: [
            .json: .init(
                schema: .array(
                    description: "The list of the ids to be deleted.",
                    minItems: 1,
                    maxItems: 1000,
                    items: Generic.Fields.uuid()
                )
            )
        ])
    }
}

public extension OpenAPI.Response.Map {

    static func bulkDelete(
        _ extras: OpenAPI.Response.Map = [:]
    ) -> Self {
        var res: OpenAPI.Response.Map = [
            204: .ref("204"),
            400: .ref("400"),
            401: .ref("401"),
            403: .ref("403"),
            404: .ref("404"),
            415: .ref("415"),
            422: .ref("422"),
        ]
        for key in extras.keys {
            res[key] = extras[key]
        }
        return res
    }

    static func delete() -> Self {
        [
            204: .ref("204"),
            400: .ref("400"),
            401: .ref("401"),
            403: .ref("403"),
            404: .ref("404"),
        ]
    }

    static func head() -> Self {
        [
            200: .response(
                description: "Ok"  //,
                    //                        headers: [
                    //                            "Content-Length": .header(
                    //                                .init(
                    //                                    schema: .integer(
                    //                                        description: "Content-Length"
                    //                                    )
                    //                                )
                    //                            )
                    //                        ]
            ),
            400: .ref("400"),
            401: .ref("401"),
            403: .ref("403"),
            404: .ref("404"),
        ]
    }

    static func list(
        _ ref: String,
        _ extras: OpenAPI.Response.Map = [:]
    ) -> Self {
        var res: OpenAPI.Response.Map = [
            200: .response(
                description: "Ok",
                content: [
                    .json: .ref(ref)
                ]
            ),
            400: .ref("400"),
            401: .ref("401"),
            403: .ref("403"),
        ]
        for key in extras.keys {
            res[key] = extras[key]
        }
        return res
    }

    static func create(
        _ ref: String,
        _ extras: OpenAPI.Response.Map = [:]
    ) -> Self {
        var res: OpenAPI.Response.Map = [
            200: .response(
                description: "Ok",
                content: [
                    .json: .ref(ref)
                ]
            ),
            400: .ref("400"),
            401: .ref("401"),
            403: .ref("403"),
            415: .ref("415"),
            422: .ref("422"),
        ]
        for key in extras.keys {
            res[key] = extras[key]
        }
        return res
    }

    static func detail(
        _ ref: String
    ) -> Self {
        [
            200: .response(
                description: "Ok",
                content: [
                    .json: .ref(ref)
                ]
            ),
            400: .ref("400"),
            401: .ref("401"),
            403: .ref("403"),
            404: .ref("404"),
        ]
    }

    static func update(
        _ ref: String
    ) -> Self {
        [
            200: .response(
                description: "Ok",
                content: [
                    .json: .ref(ref)
                ]
            ),
            400: .ref("400"),
            401: .ref("401"),
            403: .ref("403"),
            404: .ref("404"),
            415: .ref("415"),
            422: .ref("422"),
        ]
    }

    static func patch(
        _ ref: String
    ) -> Self {
        [
            200: .response(
                description: "Ok",
                content: [
                    .json: .ref(ref)
                ]
            ),
            400: .ref("400"),
            401: .ref("401"),
            403: .ref("403"),
            404: .ref("404"),
            415: .ref("415"),
            422: .ref("422"),
        ]
    }
}
