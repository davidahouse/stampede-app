//
//  HistoryBuildsViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class HistoryBuildsViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(HistoryBuildsView_Previews.previews,
                   title: "HistoryBuildsView_Previews")
    }
}