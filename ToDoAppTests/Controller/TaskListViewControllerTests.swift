//
//  TaskListViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Boris Goncharov on 6/29/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import XCTest
@testable import ToDoApp

class TaskListViewControllerTests: XCTestCase {
    
    var sut: TaskListViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self))
        sut = vc as? TaskListViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWhenViewLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewLoadedDataProviderNotNil() {
        XCTAssertNotNil(sut.dataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegetaEqualsTableViewDataSource() {
        XCTAssertEqual(
            sut.tableView.delegate as? DataProvider,
            sut.tableView.dataSource as? DataProvider
        )
    }
}
