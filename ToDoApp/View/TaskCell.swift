//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Boris Goncharov on 6/30/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    func configure(withTask task: Task) {}
}
