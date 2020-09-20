//
//  RepositoryViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(RepositoryView_Previews.previews,
                   title: "RepositoryView_Previews")
    }
}
