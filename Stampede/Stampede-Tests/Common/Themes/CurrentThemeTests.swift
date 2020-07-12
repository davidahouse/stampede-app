//
//  CurrentThemeTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class CurrentThemeTests: XCTestCase {

    func testCapturePreviews() {
        capture(CurrentTheme_Previews.previews,
            title: "CurrentTheme_Previews")
    }
}
