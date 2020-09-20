//
//  MonitorQueuesViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/7/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MonitorQueuesViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(MonitorQueuesView_Previews.previews,
                   title: "MonitorQueuesView_Previews")
    }
}
