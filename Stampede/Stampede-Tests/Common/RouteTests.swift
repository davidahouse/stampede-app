//
//  RouteTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RouteTests: XCTestCase {

    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
    }

    func testRoutesCanMakeAFeatureController() {
        XCTAssertNotNil(Route.repositoryDetails(Repository.someRepository).featureController(dependencies).view)
        XCTAssertNotNil(Route.buildDetails(BuildStatus.someRecentBuild).featureController(dependencies).view)
        XCTAssertNotNil(Route.buildDetailsFromID("123").featureController(dependencies).view)
        XCTAssertNotNil(Route.taskDetails("123").featureController(dependencies).view)
        XCTAssertNotNil(Route.repositorySourceDetails(Repository.someRepository, buildKey: "123").featureController(dependencies).view)
        XCTAssertNotNil(Route.repositoryBuildDetails(Repository.someRepository, build: "123").featureController(dependencies).view)
        XCTAssertNotNil(Route.artifactCloc(taskID: "123", title: "123").featureController(dependencies).view)
        XCTAssertNotNil(Route.monitorLive.featureController(dependencies).view)
        XCTAssertNotNil(Route.monitorActiveBuilds.featureController(dependencies).view)
        XCTAssertNotNil(Route.monitorActiveTasks.featureController(dependencies).view)
        XCTAssertNotNil(Route.monitorQueues.featureController(dependencies).view)
        XCTAssertNotNil(Route.historyTasks.featureController(dependencies).view)
        XCTAssertNotNil(Route.historyBuilds.featureController(dependencies).view)
        XCTAssertNotNil(Route.settingsStampedeServer.featureController(dependencies).view)
        XCTAssertNotNil(Route.settingsRepositories.featureController(dependencies).view)
        XCTAssertNotNil(Route.settingsNotifications.featureController(dependencies).view)
        XCTAssertNotNil(Route.settingsInfo.featureController(dependencies).view)
        XCTAssertNotNil(Route.settingsDeveloper.featureController(dependencies).view)
        XCTAssertNotNil(Route.settingsDeveloperPersona.featureController(dependencies).view)
    }

    func testURLCanBeTurnedIntoRoute() {
        let expecting: [String: Route?] = [
            "http://localhost/repositories/buildDetails?buildID=123": .buildDetailsFromID("123"),
            "http://localhost/repositories/buildDetails": nil,
            "http://localhost/somePath": nil
        ]

        for (key, value) in expecting {
            let generatedRoute = Route.fromURL(URL(string: key)!)
            XCTAssertEqual(generatedRoute, value)
        }
    }
}
