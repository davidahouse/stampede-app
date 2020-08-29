//
//  File.swift
//  
//
//  Created by David House on 5/3/20.
//

import Foundation
import Combine

//#if DEBUG
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
//public class StampedeServiceMockProvider: StampedeServiceProvider {
//
//    public let hostPassthroughSubject = PassthroughSubject<String, Never>()
//    var fetchRepositories: ([Repository]?, StampedeError?) = (Repository.someRepositories, nil)
//    var fetchRepositoryRecentBuildsResponse: ([BuildStatus]?, StampedeError?) = (BuildStatus.recentBuilds, nil)
//    var fetchRepositoryRepositoryBuildsResponse: ([RepositoryBuild]?, StampedeError?) = (RepositoryBuild.someBuilds, nil)
//
//    var fetchMonitorQueues: ([QueueSummary]?, StampedeError?) = (QueueSummary.someSummaries, nil)
//    var fetchWorkerStatus: ([WorkerStatus]?, StampedeError?) = (WorkerStatus.workerStatuses, nil)
//    var fetchMonitorActiveTasks: ([TaskStatus]?, StampedeError?) = (TaskStatus.activeTasks, nil)
//
//    var fetchAdminTasksResponse: ([Task]?, StampedeError?) = (Task.someTasks, nil)
//    var fetchAdminConfigDefaultsResponse: (ConfigDefaults?, StampedeError?) = (ConfigDefaults.someDefaults, nil)
//    var fetchAdminConfigOverridesResponse: (ConfigOverrides?, StampedeError?) = (ConfigOverrides.someOverrides, nil)
//    var fetchAdminQueuesResponse: ([Queue]?, StampedeError?) = (Queue.someQueues, nil)
//    var fetchActiveBuildsResponse: ([BuildStatus]?, StampedeError?) = (BuildStatus.activeBuilds, nil)
//
//    var fetchHistoryTasksResponse: ([TaskStatus]?, StampedeError?) = (TaskStatus.activeTasks, nil)
//    var fetchHistoryHourlySummaryResponse: ([HourlySummary]?, StampedeError?) = (HourlySummary.someSummaries, nil)
//
//    public func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], StampedeError>? {
//        if let repositories = fetchRepositories.0 {
//            return AnyPublisher<[Repository], StampedeError>(Future<[Repository], StampedeError> { promise in promise(.success(repositories))})
//        } else {
//            return AnyPublisher<[Repository], StampedeError>(Fail<[Repository], StampedeError>(error: fetchRepositories.1!))
//        }
//    }
//
//    public func fetchRecentBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], StampedeError>? {
//        if let builds = fetchRepositoryRecentBuildsResponse.0 {
//            return AnyPublisher<[BuildStatus], StampedeError>(Future<[BuildStatus], StampedeError> { promise in promise(.success(builds))})
//        } else {
//            return AnyPublisher<[BuildStatus], StampedeError>(Fail<[BuildStatus], StampedeError>(error: fetchRepositoryRecentBuildsResponse.1!))
//        }
//    }
//
//    public func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], StampedeError>? {
//        if let builds = fetchRepositoryRepositoryBuildsResponse.0 {
//            return AnyPublisher<[RepositoryBuild], StampedeError>(Future<[RepositoryBuild], StampedeError> { promise in promise(.success(builds))})
//        } else {
//            return AnyPublisher<[RepositoryBuild], StampedeError>(Fail<[RepositoryBuild], StampedeError>(error: fetchRepositoryRepositoryBuildsResponse.1!))
//        }
//    }
//
//    public func fetchAdminTasksPublisher() -> AnyPublisher<[Task], StampedeError>? {
//        if let tasks = fetchAdminTasksResponse.0 {
//            return AnyPublisher<[Task], StampedeError>(Future<[Task], StampedeError> { promise in promise(.success(tasks))})
//        } else {
//            return AnyPublisher<[Task], StampedeError>(Fail<[Task], StampedeError>(error: fetchAdminTasksResponse.1!))
//        }
//    }
//
//    public func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, StampedeError>? {
//        if let defaults = fetchAdminConfigDefaultsResponse.0 {
//            return AnyPublisher<ConfigDefaults, StampedeError>(Future<ConfigDefaults, StampedeError> { promise in promise(.success(defaults))})
//        } else {
//            return AnyPublisher<ConfigDefaults, StampedeError>(Fail<ConfigDefaults, StampedeError>(error: fetchAdminConfigDefaultsResponse.1!))
//        }
//    }
//
//    public func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, StampedeError>? {
//        if let overrides = fetchAdminConfigOverridesResponse.0 {
//            return AnyPublisher<ConfigOverrides, StampedeError>(Future<ConfigOverrides, StampedeError> { promise in promise(.success(overrides))})
//        } else {
//            return AnyPublisher<ConfigOverrides, StampedeError>(Fail<ConfigOverrides, StampedeError>(error: fetchAdminConfigOverridesResponse.1!))
//        }
//    }
//
//    public func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], StampedeError>? {
//        if let queues = fetchAdminQueuesResponse.0 {
//            return AnyPublisher<[Queue], StampedeError>(Future<[Queue], StampedeError> { promise in promise(.success(queues))})
//        } else {
//            return AnyPublisher<[Queue], StampedeError>(Fail<[Queue], StampedeError>(error: fetchAdminQueuesResponse.1!))
//        }
//    }
//
//    public func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], StampedeError>? {
//        if let queueSummary = fetchMonitorQueues.0 {
//            return AnyPublisher<[QueueSummary], StampedeError>(Future<[QueueSummary], StampedeError> { promise in promise(.success(queueSummary))})
//        } else {
//            return AnyPublisher<[QueueSummary], StampedeError>(Fail<[QueueSummary], StampedeError>(error: fetchMonitorQueues.1!))
//        }
//    }
//
//    public func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], StampedeError>? {
//        if let workerStatus = fetchWorkerStatus.0 {
//            return AnyPublisher<[WorkerStatus], StampedeError>(Future<[WorkerStatus], StampedeError> { promise in promise(.success(workerStatus))})
//        } else {
//            return AnyPublisher<[WorkerStatus], StampedeError>(Fail<[WorkerStatus], StampedeError>(error: fetchWorkerStatus.1!))
//        }
//    }
//
//    public func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>? {
//        if let tasksStatus = fetchHistoryTasksResponse.0 {
//            return AnyPublisher<[TaskStatus], StampedeError>(Future<[TaskStatus], StampedeError> { promise in promise(.success(tasksStatus))})
//        } else {
//            return AnyPublisher<[TaskStatus], StampedeError>(Fail<[TaskStatus], StampedeError>(error: fetchHistoryTasksResponse.1!))
//        }
//    }
//
//    public func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], StampedeError>? {
//        if let summary = fetchHistoryHourlySummaryResponse.0 {
//            return AnyPublisher<[HourlySummary], StampedeError>(Future<[HourlySummary], StampedeError> { promise in promise(.success(summary))})
//        } else {
//            return AnyPublisher<[HourlySummary], StampedeError>(Fail<[HourlySummary], StampedeError>(error: fetchHistoryHourlySummaryResponse.1!))
//        }
//    }
//
//    public func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], StampedeError>? {
//        if let builds = fetchActiveBuildsResponse.0 {
//            return AnyPublisher<[BuildStatus], StampedeError>(Future<[BuildStatus], StampedeError> { promise in
//                promise(.success(builds))
//            })
//        } else {
//            return AnyPublisher<[BuildStatus], StampedeError>(Fail<[BuildStatus], StampedeError>(error: fetchActiveBuildsResponse.1!))
//        }
//    }
//
//    public func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>? {
//        if let tasks = fetchMonitorActiveTasks.0 {
//            return AnyPublisher<[TaskStatus], StampedeError>(Future<[TaskStatus], StampedeError> { promise in
//                promise(.success(tasks))
//            })
//        } else {
//            return AnyPublisher<[TaskStatus], StampedeError>(Fail<[TaskStatus], StampedeError>(error: fetchMonitorActiveTasks.1!))
//        }
//    }
//}
//
//#endif
