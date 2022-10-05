//
//  RepositoryBuildDetailsViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class RepositoryBuildDetailsViewTests: XCTestCase {
    func testCapturePreviews() {
        capturedPreviews(RepositoryBuildDetailsView_Previews.capturedPreviews(title: "RepositoryBuildDetailsView_Previews"))
    }
}
