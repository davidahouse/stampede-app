//
//  RepositorySourceDetailsFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositorySourceDetailsFeatureTests: XCTestCase {

    var feature: RepositorySourceDetailsFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = RepositorySourceDetailsFeature(dependencies: dependencies, repository: Repository.someRepository, buildKey: "someBuildKey")
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let baseFeature = RepositorySourceDetailsFeature.makeFeature(dependencies, repository: Repository.someRepository, buildKey: "someBuildKey")
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "RepositorySourceDetailsFeature")
    }

    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
        XCTAssertTrue(fixtureProvider.fetchRepositorySourceBuildsPublisherCalled)
    }

    private func loadView() {
        window.addSubview(feature.view)
        RunLoop.current.run(until: Date())
    }

}
