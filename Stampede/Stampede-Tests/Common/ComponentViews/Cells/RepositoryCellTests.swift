//
//  RepositoryCellTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class RepositoryCellTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(RepositoryCell_Previews.capturedPreviews(title: "RepositoryCell"))
    }
}
