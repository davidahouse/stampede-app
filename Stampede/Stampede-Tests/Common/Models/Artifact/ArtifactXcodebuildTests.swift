//
//  ArtifactXcodebuildTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class ArtifactXcodebuildTests: XCTestCase {

    func testCanDecodeFromJSON() throws {
        
        let bundle = Bundle(for: ArtifactXcodebuildTests.self)
        guard let jsonURL = bundle.url(forResource: "ArtifactXcodebuild", withExtension: "json") else {
            XCTFail("Unable to find JSON resource")
            return
        }
        let rawData = try Data(contentsOf: jsonURL)
        let decode = JSONDecoder()
        _ = try decode.decode(ArtifactXcodebuild.self, from: rawData)
    }
}
