//
//  RepositoryTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryTests: XCTestCase {

    func testIDIsComputedFromOwnerAndRepository() {
        XCTAssertEqual(Repository.someRepository.id, Repository.someRepository.owner + "-" + Repository.someRepository.repository)
    }
    
    func testCanHashID() {
        XCTAssertEqual(Repository.someRepository.hashValue, Repository.someRepository.hashValue)
    }

}
