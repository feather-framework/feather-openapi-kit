//
//  File.swift
//
//
//  Created by Tibor Bodecs on 20/01/2024.
//

import FeatherOpenAPIKit

extension Example.Model {

    @ComponentCollection
    enum Tags {

        struct Main: Tag {
            static let name = "Model"
        }
    }
}
