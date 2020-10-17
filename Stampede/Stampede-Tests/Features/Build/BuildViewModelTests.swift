//
//  BuildViewModelTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/6/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildViewModelTests: XCTestCase {

    func testViewModelReturnsAnImageForStatus() {
        
        let buildStatuses: [BuildStatus] = [
            BuildStatus.buildCompletedHoursAgo,
            BuildStatus.buildStartedMinutesAgo,
            BuildStatus.someRecentFailedBuild
        ]
        for status in buildStatuses {
            let viewModel = BuildViewModel(state: .results(status))
            _ = viewModel.statusImage
        }
    }
}
