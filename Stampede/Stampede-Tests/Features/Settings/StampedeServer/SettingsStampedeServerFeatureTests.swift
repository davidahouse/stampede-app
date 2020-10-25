//
//  SettingsStampedeServerFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsStampedeServerFeatureTests: XCTestCase {

    var feature: SettingsStampedeServerFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = SettingsStampedeServerFeature(dependencies: dependencies)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let route = SettingsStampedeServerRoute()
        let baseFeature = route.makeFeature(dependencies)
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "SettingsStampedeServerFeature")
    }
}
