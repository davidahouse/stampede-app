//
//  TaskStatusIconTests.swift
//  Stampede-Tests
//
//  Created by David House on 2/20/21.
//  Copyright © 2021 David House. All rights reserved.
//

@testable import Stampede
import XCTest

class TaskStatusIconTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(TaskStatusIcon_Previews.capturedPreviews(title: "TaskStatusIcon"))
    }
}
