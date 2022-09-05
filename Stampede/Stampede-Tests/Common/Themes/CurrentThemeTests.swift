//
//  CurrentThemeTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class CurrentThemeTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(CurrentTheme_Previews.capturedPreviews(title: "CurrentTheme_Previews"))
    }
}
