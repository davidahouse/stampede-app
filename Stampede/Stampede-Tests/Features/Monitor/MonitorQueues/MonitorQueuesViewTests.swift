//
//  MonitorQueuesViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/7/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class MonitorQueuesViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(MonitorQueuesView_Previews.capturedPreviews(title: "MonitorQueuesView_Previews"))
    }
}
