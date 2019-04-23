//
//  LamaBabyUITests.swift
//  LamaBabyUITests
//
//  Created by Luke Phyall on 17/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import XCTest

class LamaBabyUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testGetToCodeScreen() {
        app.buttons["I'm a babysitter"].tap()
        XCTAssertTrue(app.staticTexts["Enter your code"].exists)
        app.textFields["123456"].tap()
        app.textFields["123456"].typeText("myPassword")
        XCTAssertTrue(app.textFields["myPassword"].exists)
        app.buttons["Submit"].tap()
        XCTAssertTrue(app.staticTexts["Schedule"].exists)
    }
    
    func testCanLoginAndCreateAScheduleWithItems() {
        self.loginAsParent()
        self.createASchedule(name: "Morning")
        self.addAnItemToTheCurrentSchedule(title: "Brush teeth", hour: "7", minute: "15", ampm: "AM")
        XCTAssertTrue(app.cells.staticTexts["07:15 - Brush teeth"].exists)
    }

    // MARK: helper methods
    func loginAsParent() {
        app.buttons["I'm a parent"].tap()
        app.textFields["User Name"].tap()
        app.textFields["User Name"].typeText("dave")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("123345")
        app.buttons["Log Me In"].tap()
    }
    
    func createASchedule(name: String) {
        app.buttons["Create Schedule"].tap()
        app.textFields["Schedule name"].tap()
        app.textFields["Schedule name"].typeText(name)
    }
    
    func addAnItemToTheCurrentSchedule(title: String, hour: String, minute: String, ampm: String) {
        app.buttons["Add item to Schedule"].tap()
        app.textFields["Bedtime story"].tap()
        app.textFields["Bedtime story"].typeText(title)
        app.datePickers.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "\(hour)")
        app.datePickers.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "\(minute)")
        app.datePickers.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "\(ampm)")
        app.buttons["Save Item"].tap()
    }
}
