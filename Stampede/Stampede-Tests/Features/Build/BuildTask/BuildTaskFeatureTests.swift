//
//  BuildTaskFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildTaskFeatureTests: XCTestCase {

    var feature: BuildTaskFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = BuildTaskFeature(dependencies: dependencies, taskID: "someTask")
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let baseFeature = BuildTaskFeature.makeFeature(dependencies, taskID: "someTask")
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "BuildTaskFeature")
    }

    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
        XCTAssertTrue(fixtureProvider.fetchTaskDetailsPublisherCalled)
    }

    private func loadView() {
        window.addSubview(feature.view)
        RunLoop.current.run(until: Date())
    }
}
