//
//  StampedeServiceNetworkProvider.swift
//  Stampede
//
//  Created by David House on 12/21/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public class StampedeServiceNetworkProvider: AsyncNetworkProvider, StampedeServiceProvider {

    public let hostPassthroughSubject = PassthroughSubject<String, Never>()
    private var host: String?
    private var hostSink: AnyCancellable?

    public init(host: String? = nil) {
        self.host = host
        super.init()
        hostSink = hostPassthroughSubject.sink(receiveValue: { value in
           self.host = value
        })
    }

    // Repository
    public func fetchRepositories() async throws -> [Repository] {
        return try await fetch(.repositories)
    }

    public func fetchActiveBuilds(owner: String, repository: String) async throws -> [BuildStatus] {
        return try await fetch(.activeBuilds(owner, repository))
    }

    public func fetchRepositoryBuilds(owner: String, repository: String) async throws -> [RepositoryBuild] {
        return try await fetch(.repositoryBuilds(owner, repository))
    }

    public func fetchBuildKeys(owner: String, repository: String, source: String) async throws -> [BuildKey] {
        return try await fetch(.buildKeys(owner, repository, source))
    }

    public func fetchBuildDetails(buildID: String) async throws -> [BuildStatus] {
        return try await fetch(.buildDetails(buildID))
    }

    public func fetchTaskDetails(taskID: String) async throws -> [TaskDetails] {
        return try await fetch(.taskDetails(taskID))
    }

    public func fetchRepositorySourceDetails(owner: String, repository: String, buildKey: String) async throws -> [BuildDetails] {
        return try await fetch(.repositorySourceBuilds(owner, repository, buildKey))
    }

    // Monitor

    public func fetchActiveBuilds() async throws -> [BuildStatus] {
        return try await fetch(.monitorActiveBuilds)
    }

    public func fetchMonitorQueues() async throws -> [QueueSummaries] {
        return try await fetch(.monitorQueues)
    }

    public func fetchWorkerStatus() async throws -> [WorkerStatus] {
        return try await fetch(.monitorWorkerStatus)
    }

    public func fetchActiveTasks() async throws -> [TaskStatus] {
        return try await fetch(.monitorActiveTasks)
    }

    // History
    public func fetchHistoryBuilds() async throws -> [BuildDetails] {
        return try await fetch(.historyBuilds)
    }

    public func fetchHistoryTasks() async throws -> [TaskStatus] {
        return try await fetch(.historyTasks)
    }

    public func fetchHistoryHourlySummary() async throws -> [HourlySummary] {
        return try await fetch(.historyHourlySummary)
    }

    // Admin
    public func fetchAdminTasks() async throws -> [Task] {
        return try await fetch(.adminTasks)
    }

    public func fetchAdminConfigDefaults() async throws -> ConfigDefaults {
        return try await fetch(.adminConfigDefaults)
    }

    public func fetchAdminConfigOverrides() async throws -> ConfigOverrides {
        return try await fetch(.adminConfigOverrides)
    }

    public func fetchAdminQueues() async throws -> [Queue] {
        return try await fetch(.adminQueues)
    }

    private func fetch<T: Decodable>(_ endpoint: StampedeAPIEndpoint) async throws -> T {
        guard let host = host else {
            throw ServiceError.network(description: "No host provided")
        }
        return try await request(url: endpoint.url(host: host))
    }
}
