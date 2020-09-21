//
//  StampedeServiceNetworkProviderTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class StampedeServiceNetworkProviderTests: XCTestCase {

    func testThatNotProvidingHostReturnsAnErrorFromActiveBuildsPublisher() {
        let provider = StampedeServiceNetworkProvider()
        let publisher = provider.fetchActiveBuildsPublisher()
        let expectation = XCTestExpectation(description: "waiting on publisher")
        _ = publisher?.sink(receiveCompletion: { (_) in
            expectation.fulfill()
        }, receiveValue: { (_) in
            XCTFail("Should receive an error, not a value")
        })
        wait(for: [expectation], timeout: 10.0)
    }
}
