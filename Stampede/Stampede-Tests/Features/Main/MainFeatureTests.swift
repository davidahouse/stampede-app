//
//  MainFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MainFeatureTests: XCTestCase {
    
    var mainFeature: MainFeature!
    var window: UIWindow!
    var dependencies: Dependencies!
    var repositoryList = RepositoryListFixture()
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(repositoryList: repositoryList)
        mainFeature = MainFeature(dependencies: dependencies)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func testFeatureCanCreateAChildViewController() {
        capture(mainFeature, title: "MainFeature")
    }
    
    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
        XCTAssertTrue(repositoryList.fetchRepositoriesPublisherCalled)
    }
    
    private func loadView() {
        window.addSubview(mainFeature.view)
        RunLoop.current.run(until: Date())
    }
}
