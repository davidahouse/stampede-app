//
//  StampedeErrorTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class StampedeErrorTests: XCTestCase {

    func testNetworkErrorDescription() {
        guard let description = StampedeError.network(description: "some error").errorDescription else {
            XCTFail("nil error returned")
            return
        }
        XCTAssertTrue(description.contains("Network error:"))
    }

    func testParsingErrorDescription() {
        guard let description = StampedeError.parsing(description: "some error").errorDescription else {
            XCTFail("nil error returned")
            return
        }
        XCTAssertTrue(description.contains("Parsing error:"))
    }
}
