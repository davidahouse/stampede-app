//
//  TaskSCMDetailsTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/5/22.
//  Copyright © 2022 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class TaskSCMDetailsTests: XCTestCase {
 
    func testMultilineValueIsTrueForCommits() {
        let details = TaskSCMDetails(title: "Commit", value: "some-value")
        XCTAssertTrue(details.multilineValue)
    }
    
    func testMultilineValueIsFalseForOtherDetails() {
        let details = TaskSCMDetails(title: "Other", value: "some-value")
        XCTAssertFalse(details.multilineValue)
    }

    func testDisplayValueForSHADetails() {
        let details = TaskSCMDetails(title: "SHA", value: "1234567890")
        XCTAssertEqual(details.displayValue, "1234567")
    }
    
    func testDisplayValueForOtherDetails() {
        let details = TaskSCMDetails(title: "Other", value: "1234567890")
        XCTAssertEqual(details.displayValue, "1234567890")
    }
}
