//
//  FavoriteRepositoryCellTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class FavoriteRepositoryCellTests: XCTestCase {

    func testCapturePreviews() {
        capture(FavoriteRepositoryCell_Previews.previews,
                   title: "FavoriteRepositoryCell_Previews")
    }
}
