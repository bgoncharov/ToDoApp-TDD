//
//  Task.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/28/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation

struct Task: Equatable {
    let title: String
    let descriprion: String?
    private(set) var date: Date?
    let location: Location?
    
    init(title: String, description: String? = nil, location: Location? = nil) {
        self.title = title
        self.descriprion = description
        self.date = Date()
        self.location = location
    }
}
