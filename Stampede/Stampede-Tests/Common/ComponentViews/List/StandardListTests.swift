//
//  StandardListTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class StandardListTests: XCTestCase {

    func testCapturePreviews() {
        capture(StandardList_Previews.previews,
                   title: "StandardList_Previews")
    }
}
