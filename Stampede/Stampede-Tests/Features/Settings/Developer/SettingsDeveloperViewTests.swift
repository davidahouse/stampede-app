//
//  SettingsDeveloperViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsDeveloperViewTests: XCTestCase {
    func testCapturePreviews() {
        capturedPreviews(SettingsDeveloperView_Previews.capturedPreviews(title: "SettingsDeveloperView_Previews"))
    }
}
