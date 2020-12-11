//
//  TaskStatusTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class TaskStatusTests: XCTestCase {

    override class func setUp() {
        Date.useFixtureNow = true
    }
    
    func testThatIDMatchesTaskID() {
        XCTAssertEqual(TaskStatus.queuedTask.id, TaskStatus.queuedTask.task_id)
    }
    
    func testThatBuildTitleEmptyIfMissingAnyKeyField() {
        XCTAssertNil(TaskStatus.taskWithNoOwner.buildTitle)
        XCTAssertNil(TaskStatus.taskWithNoRepository.buildTitle)
        XCTAssertNil(TaskStatus.taskWithNoBuildKey.buildTitle)
    }
    
    func testThatBuildTitleIsCorrectIfAllKeyFieldsPresent() {
        let owner = TaskStatus.queuedTask.owner ?? ""
        let repository = TaskStatus.queuedTask.repository ?? ""
        let buildKey = TaskStatus.queuedTask.build_key ?? ""
        XCTAssertEqual(TaskStatus.queuedTask.buildTitle, owner + " / " + repository + " / " + buildKey)
    }
    
    func testStartedAgoReturnsEmptyStringIfNoStartedDate() {
        XCTAssertEqual(TaskStatus.queuedTask.startedAgo, "")
    }
    
    func testStartedAgoReturnsProperDescription() {
        XCTAssertTrue(TaskStatus.taskStartedSecondsAgo.startedAgo.contains("sec"))
        XCTAssertTrue(TaskStatus.taskStartedMinutesAgo.startedAgo.contains("min"))
        XCTAssertTrue(TaskStatus.taskStartedHoursAgo.startedAgo.contains("hour"))
    }
    
    func testDurationReturnsEmptyStringIfNotStarted() {
        XCTAssertEqual(TaskStatus.queuedTask.duration, "")
    }
    
    func testDurationReturnsProperDescription() {
        XCTAssertTrue(TaskStatus.taskStartedSecondsAgo.duration.contains("sec"))
        XCTAssertTrue(TaskStatus.taskStartedMinutesAgo.duration.contains("min"))
        XCTAssertTrue(TaskStatus.taskStartedHoursAgo.duration.contains("hour"))
    }
    
    func testDurationReturnsProperDescriptionForCompletedTasks() {
        XCTAssertTrue(TaskStatus.taskCompletedInSeconds.duration.contains("sec"))
        XCTAssertTrue(TaskStatus.taskCompletedInMinutes.duration.contains("min"))
        XCTAssertTrue(TaskStatus.taskCompletedInHours.duration.contains("hour"))
    }
    
    func testWorkerPathReturnsEmptyString() {
        XCTAssertEqual(TaskStatus.queuedTask.workerPath, "")
    }
    
    func testIsHashable() {
        XCTAssertEqual(TaskStatus.queuedTask.hashValue, TaskStatus.queuedTask.hashValue)
        XCTAssertNotEqual(TaskStatus.queuedTask.hashValue, TaskStatus.completedTask.hashValue)
    }
}
