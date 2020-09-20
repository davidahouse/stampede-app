//
//  BuildTaskFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class BuildTaskFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(BuildTaskFeature_Previews.previews,
                   title: "BuildTaskFeature_Previews")
    }
}
