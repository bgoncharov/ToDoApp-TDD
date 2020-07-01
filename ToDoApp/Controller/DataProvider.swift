//
//  DataProvider.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/30/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

class DataProvider: NSObject {
    var taskManager: TaskManager?
    
}

extension DataProvider: UITableViewDelegate {
    
}

extension DataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager?.tasksCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
