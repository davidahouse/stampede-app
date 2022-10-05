//
//  SettingsDeveloperPersonaViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class SettingsDeveloperPersonaViewTests: XCTestCase {
    func testCapturePreviews() {
        capturedPreviews(SettingsDeveloperPersonaView_Previews.capturedPreviews(title: "SettingsDeveloperPersonaView_Previews"))
    }
}
