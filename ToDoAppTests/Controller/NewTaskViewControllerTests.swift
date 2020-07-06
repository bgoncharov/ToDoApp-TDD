//
//  NewTaskViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Boris Goncharov on 7/6/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class NewTaskViewControllerTests: XCTestCase {
    
    var sut: NewTaskViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHasTitleTextField() {
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
    }
    
    func testHasLocationTextField() {
        XCTAssertTrue(sut.locationTextField.isDescendant(of: sut.view))
    }
    
    func testHasDateTextField() {
        XCTAssertTrue(sut.dateTextField.isDescendant(of: sut.view))
    }
    
    func testHasAdressTextField() {
        XCTAssertTrue(sut.adressTextField.isDescendant(of: sut.view))
    }
    
    func testHasDescriptionTextField() {
        XCTAssertTrue(sut.descriptionTextField.isDescendant(of: sut.view))
    }
    
    func testHasSaveButton() {
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testHasCancelButton() {
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))
    }
    
    func testSaveUsesGoecoderToConvertCoordinateFromAddress() {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = df.date(from: "06.07.20")
        
        sut.titleTextField.text = "Foo"
        sut.locationTextField.text = "Bar"
        sut.dateTextField.text = "06.07.20"
        sut.adressTextField.text = "Fremont"
        sut.descriptionTextField.text = "Baz"
        sut.taskManager = TaskManager()
        
        sut.save()
        
        let task = sut.taskManager.task(at: 0)
        let coordinate = CLLocationCoordinate2D(latitude: 37.548271, longitude: -121.988571)
        let location = Location(name: "Bar", coordinate: coordinate)
        let generatedTask = Task(title: "foo", description: "Baz", date: date, location: location)
        
        XCTAssertEqual(task, generatedTask)
    }

}
