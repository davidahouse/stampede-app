//
//  SectionHeaderLabelTests.swift
//  Stampede-Tests
//
//  Created by David House on 1/12/21.
//  Copyright © 2021 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SectionHeaderLabelTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(SectionHeaderLabel_Previews.capturedPreviews(title: "SectionHeaderLabel"))
    }
}
