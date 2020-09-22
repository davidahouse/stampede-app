//
//  BDDTestCase.swift
//  Stampede-UITests
//
//  Created by David House on 9/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest

class BDDTestCase: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 5))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Helper methods
    func waitForStaticText(_ staticText: String) {
        XCTAssertTrue(app.staticTexts[staticText].waitForExistence(timeout: 5))
    }

    func waitForButton(_ buttonText: String) {
        XCTAssertTrue(app.buttons[buttonText].waitForExistence(timeout: 5))
    }
}
