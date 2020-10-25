//
//  BuildStatusTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildStatusTests: XCTestCase {
    
    func testStatusIndicatorGeneratedCorrectly() {
        XCTFail("testing!")
        XCTAssertEqual(BuildStatus.someActiveBuild.statusIndicator, .inProgress)
        XCTAssertEqual(BuildStatus.someRecentSuccessBuild.statusIndicator, .success)
        XCTAssertEqual(BuildStatus.someRecentFailedBuild.statusIndicator, .failure)
    }
    
    func testStartedAgoContainsValidUnits() {
        XCTAssertTrue(BuildStatus.buildStartedSecondsAgo.startedAgo.contains("sec"))
        XCTAssertTrue(BuildStatus.buildStartedMinutesAgo.startedAgo.contains("min"))
        XCTAssertTrue(BuildStatus.buildStartedHoursAgo.startedAgo.contains("hour"))
    }

    func testDurationReturnsProperDescription() {
        XCTAssertTrue(BuildStatus.buildStartedSecondsAgo.duration.contains("sec"))
        XCTAssertTrue(BuildStatus.buildStartedMinutesAgo.duration.contains("min"))
        XCTAssertTrue(BuildStatus.buildStartedHoursAgo.duration.contains("hour"))
    }
    
    func testDurationReturnsProperDescriptionForCompletedTasks() {
        XCTAssertTrue(BuildStatus.buildCompletedSecondsAgo.duration.contains("sec"))
        XCTAssertTrue(BuildStatus.buildCompletedMinutesAgo.duration.contains("min"))
        XCTAssertTrue(BuildStatus.buildCompletedHoursAgo.duration.contains("hour"))
    }
    
    func testCompletedAgoReturnsStillRunningIfNotCompleted() {
        XCTAssertEqual(BuildStatus.someActiveBuild.completedAgo, "still running")
    }
    
    func testCompletedAgoContainsValidUnits() {
        XCTAssertTrue(BuildStatus.buildCompletedSecondsAgo.completedAgo.contains("sec"))
        XCTAssertTrue(BuildStatus.buildCompletedMinutesAgo.completedAgo.contains("min"))
        XCTAssertTrue(BuildStatus.buildCompletedHoursAgo.completedAgo.contains("hour"))
    }
    
    func testBuildIdentifierGeneratedCorrectly() {
        XCTAssertEqual(BuildStatus.someActiveBuild.buildIdentifier, BuildStatus.someActiveBuild.buildDetails.build_key + "-" + "\(BuildStatus.someActiveBuild.buildDetails.build)")
    }
    
    func testBuildRepositoryGeneratedCorrectly() {
        XCTAssertEqual(BuildStatus.someActiveBuild.buildRepository, BuildStatus.someActiveBuild.buildDetails.owner + " / " + BuildStatus.someActiveBuild.buildDetails.repository)
    }
    
    func testIsHashable() {
        XCTAssertEqual(BuildStatus.someActiveBuild.hashValue, BuildStatus.someActiveBuild.hashValue)
    }
}
