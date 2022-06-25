//
//  StampedeServiceProvider.swift
//  Stampede
//
//  Created by David House on 12/21/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public protocol StampedeServiceProvider {

    var hostPassthroughSubject: PassthroughSubject<String, Never> { get }

    // Repository
    func fetchRepositories() async throws -> [Repository]
    func fetchActiveBuilds(owner: String, repository: String) async throws -> [BuildStatus]
    func fetchRepositoryBuilds(owner: String, repository: String) async throws -> [RepositoryBuild]
    func fetchBuildKeys(owner: String, repository: String, source: String) async throws -> [BuildKey]
    func fetchBuildDetails(buildID: String) async throws -> [BuildStatus]
    func fetchTaskDetails(taskID: String) async throws -> [TaskDetails]
    func fetchRepositorySourceDetails(owner: String, repository: String, buildKey: String) async throws -> [BuildDetails]

    // Monitor
    func fetchActiveBuilds() async throws -> [BuildStatus]
    func fetchMonitorQueues() async throws -> [QueueSummaries]
    func fetchWorkerStatus() async throws -> [WorkerStatus]
    func fetchActiveTasks() async throws -> [TaskStatus]

    // History
    func fetchHistoryBuilds() async throws -> [BuildDetails]
    func fetchHistoryTasks() async throws -> [TaskStatus]
    func fetchHistoryHourlySummary() async throws -> [HourlySummary]

    // Admin
    func fetchAdminTasks() async throws -> [Task]
    func fetchAdminConfigDefaults() async throws -> ConfigDefaults
    func fetchAdminConfigOverrides() async throws -> ConfigOverrides
    func fetchAdminQueues() async throws -> [Queue]
}
