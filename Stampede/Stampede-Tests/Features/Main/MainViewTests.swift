//
//  MainViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class MainViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(MainView_Previews.capturedPreviews(title: "MainView_Previews"))
    }
}
