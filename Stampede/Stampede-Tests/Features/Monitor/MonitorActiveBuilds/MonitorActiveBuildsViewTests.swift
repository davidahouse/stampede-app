//
//  MonitorActiveBuildsViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class MonitorActiveBuildsViewTests: XCTestCase {

    func testCapturePreviews() {
        capturedPreviews(MonitorActiveBuildsView_Previews.capturedPreviews(title: "MonitorActiveBuildsView_Previews"))
    }
}
