//
//  SelectRepositoryFeatureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class SelectRepositoryFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(SelectRepositoryFeature_Previews.previews,
                   title: "SelectRepositoryFeature_Previews")
    }
}
