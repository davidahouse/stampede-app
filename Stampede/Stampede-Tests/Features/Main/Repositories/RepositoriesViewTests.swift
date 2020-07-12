//
//  RepositoriesViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoriesViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(RepositoriesView_Previews.previews,
                   title: "RepositoriesView_Previews")
    }
}
