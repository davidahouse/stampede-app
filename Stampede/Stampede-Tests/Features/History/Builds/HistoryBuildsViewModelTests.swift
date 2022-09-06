//
//  HistoryBuildsViewModelTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/5/22.
//  Copyright © 2022 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class HistoryBuildsViewModelTests: XCTestCase {
    
    func testHistoryServiceCalledWhenFetchInvoked() async {
        let viewModel = HistoryBuildsViewModel()
        let fixtures = StampedeServiceFixtureProvider()
        let service = StampedeService(provider: fixtures)
        await viewModel.fetch(service: service)
        XCTAssertTrue(fixtures.fetchHistoryBuildsCalled)
    }
}
