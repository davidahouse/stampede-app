//
//  RepositorySourceDetailsViewTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/22/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositorySourceDetailsViewTests: XCTestCase {
    func testCapturePreviews() {
        capture(RepositorySourceDetailsView_Previews.previews,
                   title: "RepositorySourceDetailsView_Previews")
    }
}
