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
    
    var hostPassthroughSubject: PassthroughSubject<String, Never> = PassthroughSubject<String, Never>()
    
    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError>? {
        return fetchPublisher(repositories)
    }
    
    func fetchActiveBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], ServiceError>? {
        return fetchPublisher(repositoryActiveBuilds)
    }
    
    func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], ServiceError>? {
        return fetchPublisher(repositoryBuilds)
    }
    
    func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], ServiceError>? {
        return fetchPublisher(activeBuilds)
    }
    
    func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], ServiceError>? {
        return fetchPublisher(queues)
    }
    
    func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], ServiceError>? {
        return fetchPublisher(workerStatus)
    }
    
    func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        return fetchPublisher(activeTasks)
    }
    
    func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        return fetchPublisher(historyTasks)
    }
    
    func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], ServiceError>? {
        return fetchPublisher(hourlySummary)
    }
    
    func fetchAdminTasksPublisher() -> AnyPublisher<[Task], ServiceError>? {
        return fetchPublisher(tasks)
    }
    
    func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, ServiceError>? {
        return fetchPublisher(configDefaults)
    }
    
    func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, ServiceError>? {
        return fetchPublisher(configOverrides)
    }
    
    func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], ServiceError>? {
        return fetchPublisher(configQueues)
    }
}
#endif
