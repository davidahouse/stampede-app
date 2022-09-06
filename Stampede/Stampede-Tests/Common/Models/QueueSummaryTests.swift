//
//  QueueSummaryTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/5/22.
//  Copyright © 2022 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class QueueSummaryTests: XCTestCase {
    
    func testIsIdentifiableUsingQueueName() {
        let queueSummary = QueueSummary.noWaiting
        XCTAssertEqual(queueSummary.id, QueueSummary.noWaiting.queue)
    }
    
    func testQueueSummaryCanBeEqual() {
        let queueSummary = QueueSummary.noWaiting
        let secondQueueSummary = QueueSummary.noWaiting
        XCTAssertEqual(queueSummary, secondQueueSummary)
        XCTAssertEqual(queueSummary.hashValue, secondQueueSummary.hashValue)
    }
}
