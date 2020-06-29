//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/28/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import Foundation

class TaskManager {
    var tasksCount = 0
    let doneTasksCount = 0
    
    func add(task: Task) {
        tasksCount += 1
    }
    
    func task(at index: Int) -> Task {
        return Task(title: "")
    }
}
