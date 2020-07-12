//
//  RepositoriesFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoriesFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(RepositoriesFeature_Previews.previews,
                   title: "RepositoriesFeature_Previews")
    }
}
