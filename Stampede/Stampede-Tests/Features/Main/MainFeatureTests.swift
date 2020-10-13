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
    var dependencies = FixtureDependencies()
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        mainFeature = MainFeature(dependencies: dependencies)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func testFeatureCanCreateAChildViewController() {
        loadView()
        XCTAssertGreaterThan(mainFeature.view.subviews.count, 0)
    }
    
    func testWhenViewAppearsThenViewModelAssignedAPublisher() {
        loadView()
    }
    
    private func loadView() {
        window.addSubview(mainFeature.view)
        RunLoop.current.run(until: Date())
    }
}
