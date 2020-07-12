//
//  MainViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class MainViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(MainView_Previews.previews,
                   title: "MainView_Previews")
    }
}
