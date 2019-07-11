//
//  CV_APPUITests.swift
//  CV_APPUITests
//
//  Created by David Parra on 7/11/19.
//  Copyright © 2019 David Parra. All rights reserved.
//

import XCTest

class CV_APPUITests: XCTestCase {
    var app:  XCUIApplication!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        app.launch()
        app.buttons["studies"].tap()
        app.swipeLeft()
        app.buttons["PREV"].tap()
        app.buttons["portfolio"].tap()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.buttons["PREV"].tap()
        app.buttons["myuser"].tap()
    }
}
