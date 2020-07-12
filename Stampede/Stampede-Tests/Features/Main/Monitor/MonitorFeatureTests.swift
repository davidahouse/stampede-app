//
//  MonitorFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MonitorFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(MonitorFeature_Previews.previews,
                   title: "MonitorFeature_Previews")
    }
}
