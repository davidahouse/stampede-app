//
//  StampedeServiceFixtureProvider.swift
//  Stampede
//
//  Created by David House on 8/31/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit
import Combine

#if DEBUG
class StampedeServiceFixtureProvider: FixtureProvider, StampedeServiceProvider {

    var persona: Persona!
    private var host: String?

    var fetchRepositoriesCalled = false
    var fetchActiveBuildsCalled = false
    var fetchRepositoryBuildsCalled = false
    var fetchMonitorQueuesCalled = false
    var fetchWorkerStatusCalled = false
    var fetchActiveTasksCalled = false
    var fetchHistoryTasksCalled = false
    var fetchHistoryHourlySummaryCalled = false
    var fetchAdminTasksCalled = false
    var fetchAdminConfigDefaultsCalled = false
    var fetchAdminConfigOverridesCalled = false
    var fetchAdminQueuesCalled = false
    var fetchBuildKeysCalled = false
    var fetchBuildDetailsCalled = false
    var fetchTaskDetailsCalled = false
    var fetchHistoryBuildsCalled = false
    var fetchRepositorySourceBuildsCalled = false

    public init(host: String? = nil, persona: Persona? = HappyPersona()) {
        self.host = host
        self.persona = persona
        super.init()
    }

    public func setHost(_ host: String) {
        self.host = host
    }

    // Repository
    func fetchRepositories() async throws -> [Repository] {
        return try await fetch(persona.repositories)
    }

    func fetchActiveBuilds(owner: String, repository: String) async throws -> [BuildStatus] {
        return try await fetch(persona.repositoryActiveBuilds)
    }

    func fetchRepositoryBuilds(owner: String, repository: String) async throws -> [RepositoryBuild] {
        return try await fetch(persona.repositoryBuilds)
    }

    func fetchBuildKeys(owner: String, repository: String, source: String) async throws -> [BuildKey] {
        return try await fetch(persona.buildKeys)
    }

    func fetchBuildDetails(buildID: String) async throws -> BuildStatus {
        return try await fetch(persona.buildDetails)
    }

    func fetchTaskDetails(taskID: String) async throws -> TaskDetails {
        return try await fetch(persona.taskDetails)
    }

    func fetchRepositorySourceDetails(owner: String, repository: String, buildKey: String) async throws -> [BuildDetails] {
        return try await fetch(persona.repositorySourceBuilds)
    }

    // Monitor
    func fetchActiveBuilds() async throws -> [BuildStatus] {
        return try await fetch(persona.activeBuilds)
    }

    func fetchMonitorQueues() async throws -> QueueSummaries {
        return try await fetch(persona.queues)
    }

    func fetchWorkerStatus() async throws -> [WorkerStatus] {
        return try await fetch(persona.workerStatus)
    }

    func fetchActiveTasks() async throws -> [TaskStatus] {
        return try await fetch(persona.activeTasks)
    }

    // History
    func fetchHistoryBuilds() async throws -> [BuildDetails] {
        return try await fetch(persona.historyBuilds)
    }
    
    func fetchHistoryTasks() async throws -> [TaskStatus] {
        return try await fetch(persona.historyTasks)
    }
    
    func fetchHistoryHourlySummary() async throws -> [HourlySummary] {
        return try await fetch(persona.hourlySummary)
    }

    // Admin
    func fetchAdminTasks() async throws -> [Task] {
        return try await fetch(persona.tasks)
    }
    
    func fetchAdminConfigDefaults() async throws -> ConfigDefaults {
        return try await fetch(persona.configDefaults)
    }
    
    func fetchAdminConfigOverrides() async throws -> ConfigOverrides {
        return try await fetch(persona.configOverrides)
    }
    
    func fetchAdminQueues() async throws -> [Queue] {
        return try await fetch(persona.configQueues)
    }

    private func fetch<T>(_ result: FixtureResponse<T>) async throws -> T {
        switch result {
        case .loading:
            // TODO: Would be good to figure out how to model loading states, for
            // now though just throwing a service error. Ideally we just don't return
            // from this method.
            throw ServiceError.network(description: "Fixture state was loading")
        case .error(let error):
            throw error
        case .results(let data):
            return data
        }
    }
}

extension StampedeServiceFixtureProvider {

    static func fromString(_ persona: String) -> Persona {
        switch persona {
        case "Happy":
            return HappyPersona()
        case "Error":
            return ErrorPersona()
        case "Loading":
            return LoadingPersona()
        case "ErrorBuildDetails":
            return ErrorBuildDetailsPersona()
        default:
            return HappyPersona()
        }
    }
}
#endif
