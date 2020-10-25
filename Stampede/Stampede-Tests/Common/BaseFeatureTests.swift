//
//  BaseFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/23/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BaseFeatureTests: XCTestCase {

    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()
    var feature: BaseFeature!

    override func setUp() {
        super.setUp()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = BaseFeature(dependencies: dependencies)
    }

    func testReturnsNilIfInitializedWithACoder() {
        let coder = NSCoder()
        XCTAssertNil(BaseFeature(coder: coder))
    }

    func testCanMakeChildViewController() {
        XCTAssertNotNil(feature.makeChildViewController().view)
    }

    func testByDefaultCanRouteToAnyRoute() {
        XCTAssertTrue(feature.shouldRoute(to: HistoryTasksRoute()))
    }

    func testByDefaultRouteMethodIsPush() {
        XCTAssertEqual(feature.routeMethod(for: HistoryTasksRoute()), .push)
    }
}
