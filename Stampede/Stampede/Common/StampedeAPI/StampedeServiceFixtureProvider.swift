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
    
    var repositories = Repository.someRepositories
    var repositoryActiveBuilds = BuildStatus.activeBuilds
    var repositoryBuilds = RepositoryBuild.someBuilds
    var activeBuilds = BuildStatus.activeBuilds
    var queues = QueueSummary.someSummaries
    var workerStatus = WorkerStatus.workerStatuses
    var activeTasks = TaskStatus.activeTasks
    var historyTasks = TaskStatus.recentTasks
    var hourlySummary = HourlySummary.someSummaries
    var tasks = Task.someTasks
    var configDefaults = ConfigDefaults.someDefaults
    var configOverrides = ConfigOverrides.someOverrides
    var configQueues = Queue.someQueues
    var buildKeys = BuildKey.someBranchKeys

    var fetchRepositoriesPublisherCalled = false
    var fetchActiveBuildsPublisherCalled = false
    var fetchRepositoryBuildsPublisherCalled = false
    var fetchMonitorQueuesPublisherCalled = false
    var fetchWorkerStatusPublisherCalled = false
    var fetchActiveTasksPublisherCalled = false
    var fetchHistoryTasksPublisherCalled = false
    var fetchHistoryHourlySummaryPublisherCalled = false
    var fetchAdminTasksPublisherCalled = false
    var fetchAdminConfigDefaultsPublisherCalled = false
    var fetchAdminConfigOverridesPublisherCalled = false
    var fetchAdminQueuesPublisherCalled = false
    var fetchBuildKeysPublisherCalled = false

    var hostPassthroughSubject: PassthroughSubject<String, Never> = PassthroughSubject<String, Never>()
    
    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError>? {
        fetchRepositoriesPublisherCalled = true
        return fetchPublisher(repositories)
    }
    
    func fetchActiveBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], ServiceError>? {
        fetchActiveBuildsPublisherCalled = true
        return fetchPublisher(repositoryActiveBuilds)
    }
    
    func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], ServiceError>? {
        fetchRepositoryBuildsPublisherCalled = true
        return fetchPublisher(repositoryBuilds)
    }
    
    func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], ServiceError>? {
        fetchActiveBuildsPublisherCalled = true
        return fetchPublisher(activeBuilds)
    }
    
    func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], ServiceError>? {
        fetchMonitorQueuesPublisherCalled = true
        return fetchPublisher(queues)
    }
    
    func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], ServiceError>? {
        fetchWorkerStatusPublisherCalled = true
        return fetchPublisher(workerStatus)
    }
    
    func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        fetchActiveTasksPublisherCalled = true
        return fetchPublisher(activeTasks)
    }

    func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        fetchHistoryTasksPublisherCalled = true
        return fetchPublisher(historyTasks)
    }
    
    func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], ServiceError>? {
        fetchHistoryHourlySummaryPublisherCalled = true
        return fetchPublisher(hourlySummary)
    }
    
    func fetchAdminTasksPublisher() -> AnyPublisher<[Task], ServiceError>? {
        fetchAdminTasksPublisherCalled = true
        return fetchPublisher(tasks)
    }
    
    func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, ServiceError>? {
        fetchAdminConfigDefaultsPublisherCalled = true
        return fetchPublisher(configDefaults)
    }
    
    func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, ServiceError>? {
        fetchAdminConfigOverridesPublisherCalled = true
        return fetchPublisher(configOverrides)
    }
    
    func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], ServiceError>? {
        fetchAdminQueuesPublisherCalled = true
        return fetchPublisher(configQueues)
    }

    func fetchBuildKeysPublisher(owner: String, repository: String, source: String) -> AnyPublisher<[BuildKey], ServiceError>? {
        fetchBuildKeysPublisherCalled = true
        return fetchPublisher(buildKeys)
    }
}
#endif
