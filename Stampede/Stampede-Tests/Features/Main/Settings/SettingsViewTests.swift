//
//  SettingsViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 4/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(SettingsView_Previews.previews,
                   title: "SettingsView_Previews")
    }
}
