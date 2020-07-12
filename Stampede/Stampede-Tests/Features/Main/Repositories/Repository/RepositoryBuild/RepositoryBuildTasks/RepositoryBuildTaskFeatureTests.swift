//
//  RepositoryBuildTaskFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryBuildTaskFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(RepositoryBuildTaskFeature_Previews.previews,
                   title: "RepositoryBuildTaskFeature_Previews")
    }
}
