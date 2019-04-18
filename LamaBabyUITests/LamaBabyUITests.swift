//
//  LamaBabyUITests.swift
//  LamaBabyUITests
//
//  Created by Luke Phyall on 17/04/2019.
//  Copyright © 2019 Sexy Lama Ltd. All rights reserved.
//

import XCTest

class LamaBabyUITests: XCTestCase {

//    var app = XCUIApplication()
    var app: XCUIApplication!
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        super.setUp()
        app = XCUIApplication()
        
        app.launch()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
//    func testRegistration() {
//        app.buttons["I'm a parent"].tap()
//        app.buttons["Register Now"].tap()
//        
//        app.textFields["Username"].tap()
//        app.textFields["Username"].typeText("parent999")
//        
//        app.secureTextFields["phteven"].tap()
//        app.secureTextFields["phteven"].typeText("123456")
//        
//        app.secureTextFields["confirm"].tap()
//        app.secureTextFields["confirm"].typeText("123456")
//        
//        app.buttons["Submit"].tap()
//        XCTAssertTrue(app.buttons["Create Schedule"].exists)
//    }
    
    func testGetToSchedule() {
        app.buttons["I'm a parent"].tap()
        app.buttons["Register Now"].tap()
        
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("parent999")
        
        app.secureTextFields["phteven"].tap()
        app.secureTextFields["phteven"].typeText("123456")
        
        app.secureTextFields["confirm"].tap()
        app.secureTextFields["confirm"].typeText("123456")
        
        app.buttons["Submit"].tap()
        app.buttons["Create Schedule"].tap()
        app.buttons["Add item"].tap()
        app.datePickers.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "8")
        app.datePickers.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "15")
        app.textFields["Task"].tap()
        app.textFields["Task"].typeText("Breakfast")
        app.buttons["Add"].tap()
//        XCTAssertTrue(app.staticTexts["Breakfast"].exists)
        let cell = app.tables.element(boundBy: 0)
        XCTAssertEqual(cell.staticTexts.matching(identifier: "Breakfast").firstMatch.label, "Breakfast")
//        XCTAssertTrue(app.staticTexts["8:15"].exists)
        
        
        
        
        
    }

}
