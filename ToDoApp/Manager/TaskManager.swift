//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/28/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

class TaskManager {
    
    private var tasks: [Task] = []
    private var doneTasks: [Task] = []
    
    var tasksCount: Int {
        return tasks.count
    }
    var doneTasksCount: Int {
        return doneTasks.count
    }
    
    var tasksURL: URL {
        let fileURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let documentURL = fileURLs.first else {
            fatalError()
        }
        
        return documentURL.appendingPathComponent("tasks.plist")
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(save), name: UIApplication.willResignActiveNotification, object: nil)
        
        if let data = try? Data(contentsOf: tasksURL) {
            let dictionaries = try? PropertyListSerialization.propertyList(from: data,
                                                                           options: [],
                                                                           format: nil) as! [[String : Any]]
            
            for dict in dictionaries! {
                if let task = Task(dict: dict) {
                    tasks.append(task)
                }
            }
        }
    }
    
    deinit {
        save()
    }
    
    @objc func save() {
        let taskDictionaries = self.tasks.map {$0.dict}
        guard taskDictionaries.count > 0 else {
            try? FileManager.default.removeItem(at: tasksURL)
            return
        }
        
        let plistData = try? PropertyListSerialization.data(fromPropertyList: taskDictionaries,
                                                            format: .xml,
                                                            options: PropertyListSerialization.WriteOptions(0))
        
        try? plistData?.write(to: tasksURL, options: .atomic)
    }
    
    func add(task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }
    
    func checkTask(at index: Int) {
        var task = tasks.remove(at: 0)
        task.isDone.toggle()
        doneTasks.append(task)
    }
    
    func unCheckTask(at index: Int) {
        var task = doneTasks.remove(at: 0)
        task.isDone.toggle()
        tasks.append(task)
    }
    
    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
}
