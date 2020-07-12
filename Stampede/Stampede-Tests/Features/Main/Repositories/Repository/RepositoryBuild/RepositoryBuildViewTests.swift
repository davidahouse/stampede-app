//
//  RepositoryBuildViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryBuildViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(RepositoryBuildView_Previews.previews,
                   title: "RepositoryBuildView_Previews")
    }
}
