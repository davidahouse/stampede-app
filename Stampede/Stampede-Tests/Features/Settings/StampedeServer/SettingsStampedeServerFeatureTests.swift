//
//  SettingsStampedeServerFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsStampedeServerFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(SettingsStampedeServerFeature_Previews.previews,
                   title: "SettingsStampedeServerFeature_Previews")
    }
}
