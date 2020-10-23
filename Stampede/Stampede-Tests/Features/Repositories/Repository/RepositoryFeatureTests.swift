//
//  RepositoryFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryFeatureTests: XCTestCase {

    var repositoryFeature: RepositoryFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        repositoryFeature = RepositoryFeature(dependencies: dependencies, repository: Repository.someRepository)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let baseFeature = RepositoryFeature.makeFeature(dependencies, repository: Repository.someRepository)
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(repositoryFeature, title: "RepositoryFeature")
    }
}
