//
//  ArtifactXcodebuildFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class ArtifactXcodebuildFeatureTests: XCTestCase {

    var feature: ArtifactXcodebuildFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        feature = ArtifactXcodebuildFeature(dependencies: dependencies, taskID: "someTask", title: "someTitle")
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testCanMakeBaseFeature() {
        let baseFeature = ArtifactXcodebuildFeature.makeFeature(dependencies, taskID: "someTask", title: "someTitle")
        XCTAssertNotNil(baseFeature.view)
    }

    func testFeatureCanCreateAChildViewController() {
        capture(feature, title: "ArtifactXcodebuildFeature")
    }

    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
        XCTFail("implement once we have the publisher")
//        XCTAssertTrue(fixtureProvider.fetchArtifactXcodebuildPublisherCalled)
    }

    private func loadView() {
        window.addSubview(feature.view)
        RunLoop.current.run(until: Date())
    }
}
