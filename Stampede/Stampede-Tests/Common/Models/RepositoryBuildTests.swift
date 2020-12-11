//
//  RepositoryBuildTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryBuildTests: XCTestCase {

    override class func setUp() {
        Date.useFixtureNow = true
    }
    
    func testIDReturnsTheBuild() {
        let build = RepositoryBuild.someBuild
        XCTAssertEqual(build.id, build.build)
    }
    
    func testCompletedAgoReturnsEmptyStringIfNoLastExecutedDate() {
        XCTAssertEqual(RepositoryBuild.someOtherBuild.completedAgo, "")
    }
    
    func testCompletedAgoReturnsProperDescription() {
        XCTAssertTrue(RepositoryBuild.someBuildCompletedSecondsAgo.completedAgo.contains("sec"))
        XCTAssertTrue(RepositoryBuild.someBuildCompletedMinutesAgo.completedAgo.contains("min"))
        XCTAssertTrue(RepositoryBuild.someBuildCompletedHoursAgo.completedAgo.contains("hour"))
    }
    
    func testCanHashID() {
        XCTAssertEqual(RepositoryBuild.someBuild.hashValue, RepositoryBuild.someBuild.hashValue)
    }
}
