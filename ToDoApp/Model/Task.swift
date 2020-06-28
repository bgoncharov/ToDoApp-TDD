//
//  Task.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/28/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation

struct Task {
    var title: String
    var descriprion: String?
    private(set) var date: Date?
    
    init(title: String, description: String? = nil) {
        self.title = title
        self.descriprion = description
        self.date = Date()
    }
}
