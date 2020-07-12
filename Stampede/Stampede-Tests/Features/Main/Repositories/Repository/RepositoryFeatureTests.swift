//
//  RepositoryFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(RepositoryFeature_Previews.previews,
                   title: "RepositoryFeature_Previews")
    }
}
