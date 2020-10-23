//
//  HistoryBuildsFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class HistoryBuildsFeatureTests: XCTestCase {

    var feature: HistoryBuildsFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = HistoryBuildsFeature(dependencies: dependencies)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let baseFeature = HistoryBuildsFeature.makeFeature(dependencies)
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "HistoryBuildsFeature")
    }

    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
        XCTAssertTrue(fixtureProvider.fetchHistoryBuildsPublisherCalled)
    }

    private func loadView() {
        window.addSubview(feature.view)
        RunLoop.current.run(until: Date())
    }
}
