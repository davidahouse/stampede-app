//
//  SecondaryLabelTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class SecondaryLabelTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(SecondaryLabel_Previews.capturedPreviews(title: "SecondaryLabel"))
    }
}
