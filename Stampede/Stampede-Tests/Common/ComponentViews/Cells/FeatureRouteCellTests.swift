//
//  FeatureRouteCellTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class FeatureRouteCellTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(FeatureRouteCell_Previews.capturedPreviews(title: "FeatureRouteCell"))
    }
}
