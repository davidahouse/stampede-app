//
//  RouterTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RouterTests: XCTestCase {

    class RouterSpy: RouterDelegate {

        var shouldRouteToResult = true
        var shouldRouteToCalled = false

        var routeMethod = RouteMethod.push
        var routeMethodCalled = false

        var pushCalled = false
        var presentCalled = false

        func shouldRoute(to: Route) -> Bool {
            shouldRouteToCalled = true
            return shouldRouteToResult
        }

        func routeMethod(for: Route) -> RouteMethod {
            routeMethodCalled = true
            return routeMethod
        }

        func push(route: Route) {
            pushCalled = true
        }

        func present(route: Route) {
            presentCalled = true
        }
    }

    let routerSpy = RouterSpy()

    func testCanRouteEvenIfDelegateNotSet() {
        let router = Router()
        router.route(to: .historyTasks)
    }

    func testDelegateAskedIfShouldRoute() {
        let router = Router(delegate: routerSpy)
        router.route(to: .historyBuilds)
        XCTAssertTrue(routerSpy.routeMethodCalled)
    }

    func testDelegateCalledToPushARoute() {
        let router = Router(delegate: routerSpy)
        routerSpy.routeMethod = .push
        router.route(to: .historyBuilds)
        XCTAssertTrue(routerSpy.pushCalled)
    }

    func testDelegateCalledToPresentARoute() {
        let router = Router(delegate: routerSpy)
        routerSpy.routeMethod = .present
        router.route(to: .historyBuilds)
        XCTAssertTrue(routerSpy.presentCalled)
    }
}
