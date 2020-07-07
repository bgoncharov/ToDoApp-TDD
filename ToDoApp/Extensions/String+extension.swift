//
//  String+extension.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 7/7/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation

extension String {
    var percentEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "!@#$%^&*()-=+[]\\}{,./?<>").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        return encodedString
    }
}
