//
//  HistoryBuildsFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class HistoryBuildsFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(HistoryBuildsFeature_Previews.previews,
                   title: "HistoryBuildsFeature_Previews")
    }
}
