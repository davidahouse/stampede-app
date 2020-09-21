//
//  QueueChartViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class QueueChartViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(QueueChartView_Previews.previews,
                   title: "QueueChartView_Previews")
    }
}
