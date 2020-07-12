//
//  SettingsFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 4/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(SettingsFeature_Previews.previews,
                   title: "SettingsFeature_Previews")
    }
}
