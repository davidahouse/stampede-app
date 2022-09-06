//
//  RepositoryListFixtureTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/5/22.
//  Copyright © 2022 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryListFixtureTests: XCTestCase {
    
    let provider = RepositoryListFixtureProvider()
    
    func testCanReturnURLS() {
        XCTAssertEqual(provider.urls(for: .documentDirectory, in: .allDomainsMask).count, 0)
    }
    
    func testFileExists() {
        XCTAssertTrue(provider.fileExists(atPath: ""))
    }

    func testCanWrite() throws {
        try provider.write(Data(), to: URL(string: "http://www.apple.com")!)
    }

    func testReadCanReturnEmptyData() throws {
        let result = try provider.read(from: URL(string: "http://www.apple.com")!)
        XCTAssertEqual(result.count, 0)
    }
}
