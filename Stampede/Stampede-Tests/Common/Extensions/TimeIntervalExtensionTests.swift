//
//  TimeIntervalExtensionTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/6/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class TimeIntervalExtensionTests: XCTestCase {

    func testDurationReturnsSecsAgo() {
        let secsAgo = TimeInterval() + 12
        XCTAssertTrue(secsAgo.duration().contains("sec"))
    }

    func testDurationReturnsMinsAgo() {
        let minsAgo = TimeInterval() + 12*60
        XCTAssertTrue(minsAgo.duration().contains("min"))
    }

    func testDurationReturnsHoursAgo() {
        let hoursAgo = TimeInterval() + 12*60*60
        XCTAssertTrue(hoursAgo.duration().contains("hour"))
    }

    func testDurationReturnsDaysAgo() {
        let daysAgo = TimeInterval() + 12*60*60*60
        XCTAssertTrue(daysAgo.duration().contains("day"))
    }
}
