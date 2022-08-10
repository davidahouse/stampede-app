//
//  BuildKeyCellTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildKeyCellTests: XCTestCase {

    @MainActor func testCapturePreviews() {
        capturedPreviews(BuildKeyCell_Previews.capturedPreviews(title: "BuildKeyCell"))
    }
}
