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

    var hostPassthroughSubject: PassthroughSubject<String, Never> = PassthroughSubject<String, Never>()

    private var host: String?
    private var hostSink: AnyCancellable?

    public init(host: String? = nil, persona: Persona? = HappyPersona()) {
        self.host = host
        self.persona = persona
        super.init()
        hostSink = hostPassthroughSubject.sink(receiveValue: { value in
           self.host = value
        })
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

    func fetchBuildDetails(buildID: String) async throws -> [BuildStatus] {
        return try await fetch(persona.buildDetails)
    }

    func fetchTaskDetails(taskID: String) async throws -> [TaskDetails] {
        return try await fetch(persona.taskDetails)
    }

    func fetchRepositorySourceDetails(owner: String, repository: String, buildKey: String) async throws -> [BuildDetails] {
        return try await fetch(persona.repositorySourceBuilds)
    }

    // Monitor
    func fetchActiveBuilds() async throws -> [BuildStatus] {
        return try await fetch(persona.activeBuilds)
    }

    func fetchMonitorQueues() async throws -> [QueueSummaries] {
        return try await fetch(persona.queues)
    }

    func fetchWorkerStatus() async throws -> [WorkerStatus] {
        return try await fetch(persona.workerStatus)
    }

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







    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError>? {
        fetchRepositoriesPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.repositories)
    }
    
    func fetchActiveBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], ServiceError>? {
        fetchActiveBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.repositoryActiveBuilds)
    }
    
    func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], ServiceError>? {
        fetchRepositoryBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.repositoryBuilds)
    }
    
    func fetchBuildDetailsPublisher(buildID: String) -> AnyPublisher<BuildStatus, ServiceError>? {
        fetchBuildDetailsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.buildDetails)
    }

    func fetchTaskDetailsPublisher(taskID: String) -> AnyPublisher<TaskDetails, ServiceError>? {
        fetchTaskDetailsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.taskDetails)
    }

    func fetchRepositorySourceDetails(owner: String, repository: String, buildKey: String) -> AnyPublisher<[BuildDetails], ServiceError>? {
        fetchRepositorySourceBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.repositorySourceBuilds)
    }

    func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], ServiceError>? {
        fetchActiveBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.activeBuilds)
    }
    
    func fetchMonitorQueuesPublisher() -> AnyPublisher<QueueSummaries, ServiceError>? {
        fetchMonitorQueuesPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.queues)
    }
    
    func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], ServiceError>? {
        fetchWorkerStatusPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.workerStatus)
    }
    
    func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        fetchActiveTasksPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.activeTasks)
    }

    func fetchHistoryBuildsPublisher() -> AnyPublisher<[BuildDetails], ServiceError>? {
        fetchHistoryBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.historyBuilds)
    }

    func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        fetchHistoryTasksPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.historyTasks)
    }
    
    func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], ServiceError>? {
        fetchHistoryHourlySummaryPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.hourlySummary)
    }
    
    func fetchAdminTasksPublisher() -> AnyPublisher<[Task], ServiceError>? {
        fetchAdminTasksPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.tasks)
    }
    
    func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, ServiceError>? {
        fetchAdminConfigDefaultsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.configDefaults)
    }
    
    func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, ServiceError>? {
        fetchAdminConfigOverridesPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.configOverrides)
    }
    
    func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], ServiceError>? {
        fetchAdminQueuesPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.configQueues)
    }

    func fetchBuildKeysPublisher(owner: String, repository: String, source: String) -> AnyPublisher<[BuildKey], ServiceError>? {
        fetchBuildKeysPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.buildKeys)
    }

    func fetchRepositories() async throws -> [Repository] {
        switch persona.repositories {
        case .loading:
            return []
        case .results(let data):
            return data
        case .error(let error):
            throw error
        }
    }

    func fetchActiveBuilds() async throws -> [BuildStatus] {
        switch persona.activeBuilds {
        case .loading:
            return []
        case .error(let error):
            throw error
        case .results(let data):
            return data
        }
    }

    func fetchActiveBuilds(owner: String, repository: String) async throws -> [BuildStatus] {
        switch persona.repositoryActiveBuilds {
        case .loading:
            return []
        case .error(let error):
            throw error
        case .results(let data):
            return data
        }
    }
    
    func fetchRepositoryBuilds(owner: String, repository: String) async throws -> [RepositoryBuild] {
        switch persona.repositoryBuilds {
        case .loading:
            return []
        case .error(let error):
            throw error
        case .results(let data):
            return data
        }
    }

    func fetchBuildKeys(owner: String, repository: String, source: String) async throws -> [BuildKey] {
        switch persona.buildKeys {
        case .loading:
            return []
        case .error(let error):
            throw error
        case .results(let data):
            return data
        }
    }

    private func fetch<T>(result: FixtureResponse<T>) async throws -> T {
        switch result {
        case .loading:
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
