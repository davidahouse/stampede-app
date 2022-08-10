//
//  StampedeServiceNetworkProviderTests.swift
//  Stampede-Tests
//
//  Created by David House on 9/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import Combine
import HouseKit
@testable import Stampede

class StampedeServiceNetworkProviderTests: XCTestCase {

    let providerNoHost = StampedeServiceNetworkProvider()

    func testThatNotProvidingHostReturnsAnErrorFromPublishers() {
//        expectError(providerNoHost.fetchRepositoriesPublisher())
//        expectError(providerNoHost.fetchRepositoryBuildsPublisher(owner: "someOwner", repository: "someRepo"))
//        expectError(providerNoHost.fetchActiveBuildsPublisher())
//        expectError(providerNoHost.fetchBuildDetailsPublisher(buildID: "someID"))
//        expectError(providerNoHost.fetchTaskDetailsPublisher(taskID: "someID"))
//        expectError(providerNoHost.fetchRepositorySourceDetails(owner: "someOwner", repository: "someRepo", buildKey: "someBuildKey"))
//        expectError(providerNoHost.fetchActiveBuildsPublisher(owner: "someOwner", repository: "someRepo"))
//        expectError(providerNoHost.fetchMonitorQueuesPublisher())
//        expectError(providerNoHost.fetchWorkerStatusPublisher())
//        expectError(providerNoHost.fetchActiveTasksPublisher())
//        expectError(providerNoHost.fetchHistoryBuildsPublisher())
//        expectError(providerNoHost.fetchHistoryTasksPublisher())
//        expectError(providerNoHost.fetchHistoryHourlySummaryPublisher())
//        expectError(providerNoHost.fetchAdminTasksPublisher())
//        expectError(providerNoHost.fetchAdminConfigDefaultsPublisher())
//        expectError(providerNoHost.fetchAdminConfigOverridesPublisher())
//        expectError(providerNoHost.fetchAdminQueuesPublisher())
//        expectError(providerNoHost.fetchBuildKeysPublisher(owner: "someOwner", repository: "someRepo", source: "someSource"))
    }

    private func expectError<T>(_ publisher: AnyPublisher<T, ServiceError>?) {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        _ = publisher?.sink(receiveCompletion: { result in
            if case .failure = result {
                expectation.fulfill()
            }
        }, receiveValue: { (_) in
            XCTFail("Should receive an error, not a value")
        })
        wait(for: [expectation], timeout: 10.0)
    }

    private func expectSuccess<T>(_ publisher: AnyPublisher<T, ServiceError>?) {
        let expectation = XCTestExpectation(description: "waiting on publisher")
        _ = publisher?.sink(receiveCompletion: { result in
            if case .failure = result {
                XCTFail("Should receive a value, not an error")
            }
        }, receiveValue: { (_) in
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.0)
    }

}
