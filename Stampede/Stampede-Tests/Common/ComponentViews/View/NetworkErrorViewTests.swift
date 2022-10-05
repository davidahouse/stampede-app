//
//  NetworkErrorViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 5/25/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class NetworkErrorViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(NetworkErrorView_Previews.capturedPreviews(title: "NetworkErrorView"))
    }
}
