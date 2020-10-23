//
//  ArtifactClocViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class ArtifactClocViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(ArtifactClocView_Previews.previews,
                   title: "ArtifactClocView_Previews")
    }
}
