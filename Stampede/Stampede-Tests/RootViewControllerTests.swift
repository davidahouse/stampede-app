//
//  RootViewControllerTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RootViewControllerTests: XCTestCase {

    var viewController: RootViewController!
    var window: UIWindow!
    var dependencies: Dependencies!
    var fixtureProvider = StampedeServiceFixtureProvider()

    override func setUp() {
        super.setUp()
        window = UIWindow()
        dependencies = Dependencies(serviceProvider: fixtureProvider)
        viewController = RootViewController(style: .doubleColumn, dependencies: dependencies)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func testThatViewControllerHasAPrimaryAndSecondaryView() {
        viewController.setupInitialFeatures()
        loadView()

        if let primary = viewController.viewController(for: .primary) as? UINavigationController {
            XCTAssertNotNil(primary.topViewController)
        } else {
            XCTFail("Primary view controller not a UINavigationController")
        }

        if let secondary = viewController.viewController(for: .secondary) as? UINavigationController {
            XCTAssertNil(secondary.topViewController)
        } else {
            XCTFail("Primary view controller not a UINavigationController")
        }
    }

    func testThatViewControllerCanInitializeWithAnInitialRoute() {
        viewController.setupInitialFeatures(MonitorActiveBuildsRoute())
        loadView()

        if let primary = viewController.viewController(for: .primary) as? UINavigationController {
            XCTAssertNotNil(primary.topViewController)
        } else {
            XCTFail("Primary view controller not a UINavigationController")
        }

        if let secondary = viewController.viewController(for: .secondary) as? UINavigationController {
            XCTAssertNotNil(secondary.topViewController)
        } else {
            XCTFail("Primary view controller not a UINavigationController")
        }
    }

    private func loadView() {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
}
