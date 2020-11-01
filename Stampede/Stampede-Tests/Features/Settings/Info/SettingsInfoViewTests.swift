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
        capturedPreviews(SettingsInfoView_Previews.capturedPreviews(title: "SettingsInfoView_Previews"))
    }
}
