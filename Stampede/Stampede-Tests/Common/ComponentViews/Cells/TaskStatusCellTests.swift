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
        capture(TaskStatusCell_Previews.previews,
                   title: "TaskStatusCell_Previews")
    }
}
