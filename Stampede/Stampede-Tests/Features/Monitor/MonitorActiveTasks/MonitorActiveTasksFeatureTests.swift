//
//  MonitorActiveTasksFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MonitorActiveTasksFeatureTests: XCTestCase {

    var feature: MonitorActiveTasksFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = MonitorActiveTasksFeature(dependencies: dependencies)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let baseFeature = MonitorActiveTasksFeature.makeFeature(dependencies)
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "MonitorActiveTasksFeature")
    }

    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
        XCTAssertTrue(fixtureProvider.fetchActiveTasksPublisherCalled)
    }

    private func loadView() {
        window.addSubview(feature.view)
        RunLoop.current.run(until: Date())
    }
}
