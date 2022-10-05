//
//  FavoriteRepositoryCellTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class FavoriteRepositoryCellTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(FavoriteRepositoryCell_Previews.capturedPreviews(title: "FavoriteRepositoryCell"))
    }
}
