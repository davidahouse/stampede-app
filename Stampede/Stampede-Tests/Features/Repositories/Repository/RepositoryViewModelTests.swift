//
//  RepositoryViewModelTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/23/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import Combine
import HouseKit
@testable import Stampede

class RepositoryViewModelTests: XCTestCase {

    let viewModel = RepositoryViewModel(repository: Repository.someRepository)

    func testWhenActiveBuildsPublisherReturnsValueThenPropertyUpdates() {
        let result: [BuildStatus] = BuildStatus.activeBuilds
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.activeBuildsPublisher =
            AnyPublisher<[BuildStatus], ServiceError>(Future<[BuildStatus], ServiceError> { promise in promise(.success(result))})
        let cancellable = viewModel.$activeBuildsState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .results:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenActiveBuildsPublisherReturnsErrorThenPropertyUpdates() {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.activeBuildsPublisher =
            AnyPublisher<[BuildStatus], ServiceError>(Future<[BuildStatus], ServiceError> { promise in promise(.failure(.network(description: "some network error")))})
        let cancellable = viewModel.$activeBuildsState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .networkError:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenRepositoryBuildsPublisherReturnsValueThenPropertyUpdates() {
        let result: [RepositoryBuild] = RepositoryBuild.someBuilds
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.repositoryBuildsPublisher =
            AnyPublisher<[RepositoryBuild], ServiceError>(Future<[RepositoryBuild], ServiceError> { promise in promise(.success(result))})
        let cancellable = viewModel.$repositoryBuildsState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .results:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenRepositoryBuildsPublisherReturnsErrorThenPropertyUpdates() {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.repositoryBuildsPublisher =
            AnyPublisher<[RepositoryBuild], ServiceError>(Future<[RepositoryBuild], ServiceError> { promise in promise(.failure(.network(description: "some network error")))})
        let cancellable = viewModel.$repositoryBuildsState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .networkError:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenBranchKeysPublisherReturnsValueThenPropertyUpdates() {
        let result: [BuildKey] = BuildKey.someBranchKeys
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.branchKeysPublisher =
            AnyPublisher<[BuildKey], ServiceError>(Future<[BuildKey], ServiceError> { promise in promise(.success(result))})
        let cancellable = viewModel.$branchKeysState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .results:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenBranchKeysPublisherReturnsErrorThenPropertyUpdates() {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.branchKeysPublisher =
            AnyPublisher<[BuildKey], ServiceError>(Future<[BuildKey], ServiceError> { promise in promise(.failure(.network(description: "some network error")))})
        let cancellable = viewModel.$branchKeysState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .networkError:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenReleaseKeysPublisherReturnsValueThenPropertyUpdates() {
        let result: [BuildKey] = BuildKey.someReleaseKeys
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.releaseKeysPublisher =
            AnyPublisher<[BuildKey], ServiceError>(Future<[BuildKey], ServiceError> { promise in promise(.success(result))})
        let cancellable = viewModel.$releaseKeysState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .results:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenReleaseKeysPublisherReturnsErrorThenPropertyUpdates() {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.releaseKeysPublisher =
            AnyPublisher<[BuildKey], ServiceError>(Future<[BuildKey], ServiceError> { promise in promise(.failure(.network(description: "some network error")))})
        let cancellable = viewModel.$releaseKeysState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .networkError:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenPullRequestKeysPublisherReturnsValueThenPropertyUpdates() {
        let result: [BuildKey] = BuildKey.somePRKeys
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.pullRequestKeysPublisher =
            AnyPublisher<[BuildKey], ServiceError>(Future<[BuildKey], ServiceError> { promise in promise(.success(result))})
        let cancellable = viewModel.$pullRequestKeysState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .results:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }

    func testWhenPullRequestKeysPublisherReturnsErrorThenPropertyUpdates() {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.pullRequestKeysPublisher =
            AnyPublisher<[BuildKey], ServiceError>(Future<[BuildKey], ServiceError> { promise in promise(.failure(.network(description: "some network error")))})
        let cancellable = viewModel.$pullRequestKeysState.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            switch value {
            case .networkError:
                expectation.fulfill()
            default:
                print("received other value")
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
    }
}
