//
//  HistoryBuildsViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class HistoryBuildsViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(HistoryBuildsView_Previews.capturedPreviews(title: "HistoryBuildsView_Previews"))
    }
}
