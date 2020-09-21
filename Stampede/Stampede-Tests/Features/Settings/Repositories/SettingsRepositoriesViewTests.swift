//
//  SettingsRepositoriesViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SettingsRepositoriesViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(SettingsRepositoriesView_Previews.previews,
                   title: "SettingsRepositoriesView_Previews")
    }
}