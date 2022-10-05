//
//  MonitorActiveTasksViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class MonitorActiveTasksViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(MonitorActiveTasksView_Previews.capturedPreviews(title: "MonitorActiveTasksView_Previews"))
    }
}
