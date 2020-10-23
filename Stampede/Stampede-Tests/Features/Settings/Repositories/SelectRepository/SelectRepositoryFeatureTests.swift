//
//  SelectRepositoryFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SelectRepositoryFeatureTests: XCTestCase {

    var feature: SelectRepositoryFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = SelectRepositoryFeature(dependencies: dependencies, delegate: nil)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "SelectRepositoryFeature")
    }
}
