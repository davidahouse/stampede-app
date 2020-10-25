//
//  ArtifactXcodebuildViewModelTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import Combine
import HouseKit
@testable import Stampede

class ArtifactXcodebuildViewModelTests: XCTestCase {

    let viewModel = ArtifactXcodebuildViewModel()

    func testViewModelCalculatesSortedTestResults() {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        let result = ArtifactXcodebuild.someXcodebuild
        viewModel.publisher =
            AnyPublisher<ArtifactXcodebuild, ServiceError>(Future<ArtifactXcodebuild, ServiceError> { promise in promise(.success(result))})
        let cancellable = viewModel.$testResults.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.count > 0 {
                expectation.fulfill()
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testViewModelCalculatesSortedCoverages() {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        let result = ArtifactXcodebuild.someXcodebuild
        viewModel.publisher =
            AnyPublisher<ArtifactXcodebuild, ServiceError>(Future<ArtifactXcodebuild, ServiceError> { promise in promise(.success(result))})
        let cancellable = viewModel.$coverages.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.count > 0 {
                expectation.fulfill()
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

}
