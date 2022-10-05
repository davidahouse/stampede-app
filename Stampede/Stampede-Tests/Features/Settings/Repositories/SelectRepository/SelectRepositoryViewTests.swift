//
//  SelectRepositoryViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class SelectRepositoryViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(SelectRepositoryView_Previews.capturedPreviews(title: "SelectRepositoryView_Previews"))
    }
}
