//
//  BuildFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildFeatureTests: XCTestCase {

    var feature: BuildFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = BuildFeature(dependencies: dependencies, buildStatus: BuildStatus.someRecentBuild)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let route = BuildRoute(build: BuildStatus.someRecentBuild, buildID: nil)
        let baseFeature = route.makeFeature(dependencies)
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "BuildFeature")
    }
}
