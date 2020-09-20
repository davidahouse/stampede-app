//
//  HistoryTasksFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class HistoryTasksFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(HistoryTasksFeature_Previews.previews,
                   title: "HistoryTasksFeature_Previews")
    }
}
