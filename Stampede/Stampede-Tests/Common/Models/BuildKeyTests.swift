//
//  BuildKeyTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildKeyTests: XCTestCase {

    override class func setUp() {
        Date.useFixtureNow = true
    }

    func testIDMatchesBuildKey() {
        XCTAssertEqual(BuildKey.someBuildKey.id, BuildKey.someBuildKey.buildKey)
    }
    
    func testIsHashable() {
        XCTAssertEqual(BuildKey.someBuildKey.hashValue, BuildKey.someBuildKey.hashValue)
    }
    
    func testStartedAgoIsEmptyStringIfLastExecutedIsEmpty() {
        XCTAssertEqual(BuildKey.someBuildKeyWithNoLastExecuted.startedAgo, "")
    }
    
    func testStartedAgoContainsValidUnits() {
        XCTAssertTrue(BuildKey.lastExecutedSecondsAgo.startedAgo.contains("sec"))
        XCTAssertTrue(BuildKey.lastExecutedMinutesAgo.startedAgo.contains("min"))
        XCTAssertTrue(BuildKey.lastExecutedHoursAgo.startedAgo.contains("hour"))
    }
}
