//
//  HistoryTasksViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class HistoryTasksViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(HistoryTasksView_Previews.previews,
                   title: "HistoryTasksView_Previews")
    }
}
