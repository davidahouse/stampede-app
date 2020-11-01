//
//  ArtifactXcodebuildViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class ArtifactXcodebuildViewTests: XCTestCase {
    func testCapturePreviews() {
        capturedPreviews(ArtifactXcodebuildView_Previews.capturedPreviews(title: "ArtifactXcodebuildView"))
    }
}
