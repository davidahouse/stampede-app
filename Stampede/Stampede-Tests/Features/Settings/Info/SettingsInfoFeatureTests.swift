//
//  SettingsInfoFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsInfoFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(SettingsInfoFeature_Previews.previews,
                   title: "SettingsInfoFeature_Previews")
    }
}
