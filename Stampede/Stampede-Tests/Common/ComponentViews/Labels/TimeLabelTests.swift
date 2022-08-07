//
//  TimeLabelTests.swift
//  Stampede-Tests
//
//  Created by David House on 2/27/21.
//  Copyright © 2021 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class TimeLabelTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(TimeLabel_Previews.capturedPreviews(title: "TimeLabel"))
    }
}
