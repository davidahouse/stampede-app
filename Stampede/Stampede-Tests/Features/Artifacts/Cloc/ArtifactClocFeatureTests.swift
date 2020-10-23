//
//  ArtifactClocFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class ArtifactClocFeatureTests: XCTestCase {

    var feature: ArtifactClocFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = ArtifactClocFeature(dependencies: dependencies, taskID: "someTask", title: "someTitle")
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let baseFeature = ArtifactClocFeature.makeFeature(dependencies, taskID: "someTask", title: "someTitle")
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "ArtifactClocFeature")
    }

    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
        XCTAssertTrue(fixtureProvider.fetchArtifactClocPublisherCalled)
    }

    private func loadView() {
        window.addSubview(feature.view)
        RunLoop.current.run(until: Date())
    }
}
