//
//  QueueGaugeViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class QueueGaugeViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(QueueGaugeView_Previews.previews,
                   title: "QueueGaugeView_Previews")
    }
}