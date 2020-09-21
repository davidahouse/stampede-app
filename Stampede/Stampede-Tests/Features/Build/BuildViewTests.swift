//
//  BuildViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(BuildView_Previews.previews,
                   title: "BuildView_Previews")
    }
}
