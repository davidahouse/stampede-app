//
//  MonitorLiveFeatureTestts.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MonitorLiveFeatureTests: XCTestCase {

    var feature: MonitorLiveFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = MonitorLiveFeature(dependencies: dependencies)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeFeature() {
        let baseFeature = MonitorLiveFeature.makeFeature(dependencies)
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "MonitorLiveFeature")
    }

    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
        XCTAssertTrue(fixtureProvider.fetchWorkerStatusPublisherCalled)
        XCTAssertTrue(fixtureProvider.fetchMonitorQueuesPublisherCalled)
    }

    private func loadView() {
        window.addSubview(feature.view)
        RunLoop.current.run(until: Date())
    }
}
