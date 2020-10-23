//
//  RepositoryBuildDetailsViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryBuildDetailsViewTests: XCTestCase {
    func testCapturePreviews() {
        capture(RepositoryBuildDetailsView_Previews.previews,
                   title: "RepositoryBuildDetailsView_Previews")
    }
}
