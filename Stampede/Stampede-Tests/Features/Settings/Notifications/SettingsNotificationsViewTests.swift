//
//  SettingsNotificationsViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsNotificationsViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(SettingsNotificationsView_Previews.capturedPreviews(title: "SettingsNotificationsView_Previews"))
    }
}
