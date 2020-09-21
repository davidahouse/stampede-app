//
//  WorkerStatusTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class WorkerStatusTests: XCTestCase {

    func testIDComputedProperly() {
        XCTAssertEqual(WorkerStatus.someWorker.id, WorkerStatus.someWorker.node + WorkerStatus.someWorker.workerName)
    }
}
