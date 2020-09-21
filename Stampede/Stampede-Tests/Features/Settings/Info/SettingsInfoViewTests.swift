//
//  SettingsInfoViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsInfoViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(SettingsInfoView_Previews.previews,
                   title: "SettingsInfoView_Previews")
    }
}
