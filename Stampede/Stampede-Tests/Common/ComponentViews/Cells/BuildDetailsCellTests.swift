//
//  BuildDetailsCellTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildDetailsCellTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(BuildDetailsCell_Previews.capturedPreviews(title: "BuildDetailsCell"))
    }
}
