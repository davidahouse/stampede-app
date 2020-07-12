//
//  MonitorActiveBuildsFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MonitorActiveBuildsFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(MonitorActiveBuildsFeature_Previews.previews,
                   title: "MonitorActiveBuildsFeature_Previews")
    }
}
