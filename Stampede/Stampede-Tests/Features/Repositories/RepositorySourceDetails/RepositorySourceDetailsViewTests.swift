//
//  RepositorySourceDetailsViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class RepositorySourceDetailsViewTests: XCTestCase {
    func testCapturePreviews() {
        capturedPreviews(RepositorySourceDetailsView_Previews.capturedPreviews(title: "RepositorySourceDetailsView_Previews"))
    }
}
