//
//  Task.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/28/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation

struct Task {
    let title: String
    let descriprion: String?
    let date: Date
    let location: Location?
    
    init(title: String,
         description: String? = nil,
         date: Date? = nil,
         location: Location? = nil) {
        self.title = title
        self.descriprion = description
        self.date = date ?? Date()
        self.location = location
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        if
            lhs.title == rhs.title,
            lhs.descriprion == rhs.descriprion,
            lhs.location == rhs.location {
            return true
        }
        return false
    }
}
