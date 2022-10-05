//
//  RepositoryViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class RepositoryViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(RepositoryView_Previews.capturedPreviews(title: "RepositoryView_Previews"))
    }
}
