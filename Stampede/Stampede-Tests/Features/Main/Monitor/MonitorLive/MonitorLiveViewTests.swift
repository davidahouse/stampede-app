//
//  MonitorLiveViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 6/6/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MonitorLiveViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(MonitorLiveView_Previews.previews,
                   title: "MonitorLiveView_Previews")
    }
}
