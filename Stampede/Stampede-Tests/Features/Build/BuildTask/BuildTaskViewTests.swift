//
//  BuildTaskViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildTaskViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(BuildTaskView_Previews.previews,
                   title: "BuildTaskView_Previews")
    }
}