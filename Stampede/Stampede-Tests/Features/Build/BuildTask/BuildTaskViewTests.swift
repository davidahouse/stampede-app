//
//  BuildTaskViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class BuildTaskViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(BuildTaskView_Previews.capturedPreviews(title: "BuildTaskView_Previews"))
    }
}
