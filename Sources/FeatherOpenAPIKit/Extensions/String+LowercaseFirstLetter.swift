//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 20/01/2024.
//

extension String {

    func lowercaseFirstLetter() -> String {
        guard !isEmpty else {
            return self
        }
        return prefix(1).lowercased() + dropFirst()
    }
}
