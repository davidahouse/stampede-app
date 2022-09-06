//
//  MainViewModelTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/5/22.
//  Copyright © 2022 David House. All rights reserved.
//

import XCTest
@testable import Stampede

@MainActor
class MainViewModelTests: XCTestCase {
    
    func testCanGenerateARepositoryViewModelFromARepository() {
        let viewModel = MainViewModel()
        let repositoryViewModel = viewModel.viewModelFor(repository: Repository.someRepository)
        XCTAssertEqual(repositoryViewModel.repository, Repository.someRepository)
    }
}
