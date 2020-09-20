//
//  SelectRepositoryViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SelectRepositoryViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(SelectRepositoryView_Previews.previews,
                   title: "SelectRepositoryView_Previews")
    }
}
