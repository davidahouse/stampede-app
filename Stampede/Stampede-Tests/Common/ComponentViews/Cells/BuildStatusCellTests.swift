//
//  BuildStatusCellTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildStatusCellTests: XCTestCase {

    func testCapturePreviews() {
        capture(BuildStatusCell_Previews.previews,
                   title: "BuildStatusCell_Previews")
    }
}