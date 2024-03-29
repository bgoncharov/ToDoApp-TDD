//
//  TaskCellTests.swift
//  ToDoAppTests
//
//  Created by Boris Goncharov on 7/3/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import XCTest
@testable import ToDoApp

class TaskCellTests: XCTestCase {
    
    var cell: TaskCell!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self)) as! TaskListViewController
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCellHasTitleLable() {
        XCTAssertNotNil(cell.titleLabel)
        
    }
    
    func testCellHasTitleLabelInContentView() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func testCellHasLocationLable() {
           XCTAssertNotNil(cell.locationLabel)
           
       }
       
    func testCellHasLocationLabelInContentView() {
           XCTAssertTrue(cell.locationLabel.isDescendant(of: cell.contentView))
       }
    
    func testCellHasDateLable() {
           XCTAssertNotNil(cell.dateLabel)
           
       }
       
    func testCellHasDateLabelInContentView() {
           XCTAssertTrue(cell.dateLabel.isDescendant(of: cell.contentView))
       }
    
    func testConfigureSetsTitle() {
        let task = Task(title: "Foo")
        
        cell.configure(withTask: task)
        
        XCTAssertEqual(cell.titleLabel.text, task.title)
    }
    
    func testConfigureSetsDate() {
        let task = Task(title: "Foo")
        
        cell.configure(withTask: task)
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = task.date
        let dateSring = df.string(from: date)
        
        XCTAssertEqual(cell.dateLabel.text, dateSring)
    }
    
    func testConfigureSetsLocation() {
        let location = Location(name: "Foo")
        let task = Task(title: "Bar", location: location)
        
        cell.configure(withTask: task)
        
        XCTAssertEqual(cell.locationLabel.text, task.location?.name)
    }
    
    func configureCellWithTask() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task, done: true)
    }
    
    func testDoneTaskShouldStrikeThrough() {
        configureCellWithTask()
        
        let attributedString = NSAttributedString(string: "Foo", attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
        
        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
    }
    
    func testDoneTestDateLabelTextEquasEmptyString() {
        configureCellWithTask()
        XCTAssertEqual(cell.dateLabel.text, "")
    }
    
    func testDoneTestLocationLabelTextEquasEmptyString() {
        configureCellWithTask()
        XCTAssertEqual(cell.locationLabel.text, "")
    }
}

extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
