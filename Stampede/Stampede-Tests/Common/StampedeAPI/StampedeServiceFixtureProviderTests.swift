//
//  StampedeServiceFixtureProviderTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/23/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import Combine
import HouseKit
@testable import Stampede

class StampedeServiceFixtureProviderTests: XCTestCase {

    let providerNoHost = StampedeServiceFixtureProvider()
    let provider = StampedeServiceFixtureProvider(host: "fixtures")

    func testCanReturnAPersonaFromAString() {
        let possiblePersonas = [ "Happy", "Error", "Loading", "ErrorBuildDetails", "Invalid" ]
        for possible in possiblePersonas {
            _ = StampedeServiceFixtureProvider.fromString(possible)
        }
    }

    func testThatNotProvidingHostReturnsAnErrorFromPublishers() {
        expectError(providerNoHost.fetchRepositoriesPublisher())
        expectError(providerNoHost.fetchRepositoryBuildsPublisher(owner: "someOwner", repository: "someRepo"))
        expectError(providerNoHost.fetchActiveBuildsPublisher())
        expectError(providerNoHost.fetchBuildDetailsPublisher(buildID: "someID"))
        expectError(providerNoHost.fetchTaskDetailsPublisher(taskID: "someID"))
        expectError(providerNoHost.fetchRepositorySourceDetails(owner: "someOwner", repository: "someRepo", buildKey: "someBuildKey"))
        expectError(providerNoHost.fetchActiveBuildsPublisher(owner: "someOwner", repository: "someRepo"))
        expectError(providerNoHost.fetchMonitorQueuesPublisher())
        expectError(providerNoHost.fetchWorkerStatusPublisher())
        expectError(providerNoHost.fetchActiveTasksPublisher())
        expectError(providerNoHost.fetchHistoryBuildsPublisher())
        expectError(providerNoHost.fetchHistoryTasksPublisher())
        expectError(providerNoHost.fetchHistoryHourlySummaryPublisher())
        expectError(providerNoHost.fetchAdminTasksPublisher())
        expectError(providerNoHost.fetchAdminConfigDefaultsPublisher())
        expectError(providerNoHost.fetchAdminConfigOverridesPublisher())
        expectError(providerNoHost.fetchAdminQueuesPublisher())
        expectError(providerNoHost.fetchBuildKeysPublisher(owner: "someOwner", repository: "someRepo", source: "someSource"))
    }

    func testThatWithAHostItReturnsSuccessFromPublishers() {
        expectSuccess(provider.fetchRepositoriesPublisher())
        expectSuccess(provider.fetchRepositoryBuildsPublisher(owner: "someOwner", repository: "someRepo"))
        expectSuccess(provider.fetchActiveBuildsPublisher())
        expectSuccess(provider.fetchBuildDetailsPublisher(buildID: "someID"))
        expectSuccess(provider.fetchTaskDetailsPublisher(taskID: "someID"))
        expectSuccess(provider.fetchRepositorySourceDetails(owner: "someOwner", repository: "someRepo", buildKey: "someBuildKey"))
        expectSuccess(provider.fetchActiveBuildsPublisher(owner: "someOwner", repository: "someRepo"))
        expectSuccess(provider.fetchMonitorQueuesPublisher())
        expectSuccess(provider.fetchWorkerStatusPublisher())
        expectSuccess(provider.fetchActiveTasksPublisher())
        expectSuccess(provider.fetchHistoryBuildsPublisher())
        expectSuccess(provider.fetchHistoryTasksPublisher())
        expectSuccess(provider.fetchHistoryHourlySummaryPublisher())
        expectSuccess(provider.fetchAdminTasksPublisher())
        expectSuccess(provider.fetchAdminConfigDefaultsPublisher())
        expectSuccess(provider.fetchAdminConfigOverridesPublisher())
        expectSuccess(provider.fetchAdminQueuesPublisher())
        expectSuccess(provider.fetchBuildKeysPublisher(owner: "someOwner", repository: "someRepo", source: "someSource"))
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
