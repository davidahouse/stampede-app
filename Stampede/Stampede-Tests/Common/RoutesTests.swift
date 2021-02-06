//
//  RoutesTests.swift
//  Stampede-Tests
//
//  Created by David House on 11/7/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RoutesTests: XCTestCase {

    let routes = Routes()
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
    }

    func testCanRouteUsingRepository() {
        let route = routes.route(for: Repository.someRepository)
        XCTAssertNotNil(route.makeFeature(dependencies).view)
    }

    func testCanRouteToMainMenuItems() {
        for item in MainMenuItem.allCases {
            let route = routes.route(for: item)
            XCTAssertNotNil(route.makeFeature(dependencies).view)
        }
    }

    func testCanRouteToBuildStatus() {
        let route = routes.route(for: BuildStatus.someActiveBuild)
        XCTAssertNotNil(route.makeFeature(dependencies).view)
    }

    func testCanRouteToBuildID() {
        let route = routes.routeForBuildID("123")
        XCTAssertNotNil(route.makeFeature(dependencies).view)
    }

    func testCanRouteToTaskID() {
        let route = routes.routeForTask("123")
        XCTAssertNotNil(route.makeFeature(dependencies).view)
    }

    func testCanRouteToRepositoryBuild() {
        let route = routes.routeForRepositoryBuild(Repository.someRepository, build: "some-build")
        XCTAssertNotNil(route.makeFeature(dependencies).view)
    }

    func testCanRouteToRepositoryBuildKey() {
        let route = routes.routeForRepositorySourceDetails(Repository.someRepository, buildKey: "some-build")
        XCTAssertNotNil(route.makeFeature(dependencies).view)
    }

    func testCanRouteSettingsDeveloperPersonaRoute() {
        let route = routes.routeSettingsDeveloperPersonaRoute()
        XCTAssertNotNil(route.makeFeature(dependencies).view)
    }

    func testCanRouteToArtifactTypes() {
        let types: [TaskArtifact] = [TaskArtifact.linkArtifact,
                                   TaskArtifact.someArtifact]
        for type in types {
            let route = routes.routeForArtifact("some-task", artifact: type)
            XCTAssertNotNil(route.makeFeature(dependencies).view)
        }
    }
}
