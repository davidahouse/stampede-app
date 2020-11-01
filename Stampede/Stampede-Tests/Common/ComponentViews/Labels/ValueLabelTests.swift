//
//  ValueLabelTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class ValueLabelTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(ValueLabel_Previews.capturedPreviews(title: "ValueLabel"))
    }
}
