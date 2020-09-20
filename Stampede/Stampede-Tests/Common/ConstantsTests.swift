//
//  ConstantsTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class ConstantsTests: XCTestCase {

    func testCanReturnDateFormatter() {
        XCTAssertEqual(Constants.iso8601Full.dateFormat, "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
}
