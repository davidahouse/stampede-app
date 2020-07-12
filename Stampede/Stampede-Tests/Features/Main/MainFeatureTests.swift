//
//  MainFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MainFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(MainFeature_Previews.previews,
                   title: "MainFeature_Previews")
    }
}
