//
//  TaskStatusCellTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class TaskStatusCellTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(TaskStatusCell_Previews.capturedPreviews(title: "TaskStatusCell"))
    }
}
