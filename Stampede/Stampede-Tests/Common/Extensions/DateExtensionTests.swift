//
//  DateExtensionTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/6/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class DateExtensionTests: XCTestCase {

    override class func setUp() {
        Date.useFixtureNow = true
    }

    func testAgoReturnsSecsAgo() {
        let secsAgo = Date.safeNow().addingTimeInterval(-12)
        XCTAssertTrue(secsAgo.ago().contains("sec"))
    }

    func testAgoReturnsMinsAgo() {
        let minsAgo = Date.safeNow().addingTimeInterval(-12*60)
        XCTAssertTrue(minsAgo.ago().contains("min"))
    }

    func testAgoReturnsHoursAgo() {
        let hoursAgo = Date.safeNow().addingTimeInterval(-12*60*60)
        XCTAssertTrue(hoursAgo.ago().contains("hour"))
    }

    func testAgoReturnsDaysAgo() {
        let daysAgo = Date.safeNow().addingTimeInterval(-12*60*60*60)
        XCTAssertTrue(daysAgo.ago().contains("day"))
    }
}
