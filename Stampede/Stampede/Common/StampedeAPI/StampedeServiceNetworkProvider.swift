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
public class StampedeServiceNetworkProvider: NetworkProvider, StampedeServiceProvider {

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

    public func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[Repository], ServiceError>(Future<[Repository], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.repositories.url(host: host))
    }

    public func fetchActiveBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[BuildStatus], ServiceError>(Future<[BuildStatus], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.activeBuilds(owner, repository).url(host: host))
    }

    public func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[RepositoryBuild], ServiceError>(Future<[RepositoryBuild], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.repositoryBuilds(owner, repository).url(host: host))
    }
    
    public func fetchBuildDetailsPublisher(buildID: String) -> AnyPublisher<BuildStatus, ServiceError>? {
        guard let host = host else {
            return AnyPublisher<BuildStatus, ServiceError>(Future<BuildStatus, ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.buildDetails(buildID).url(host: host))
    }

    public func fetchTaskDetailsPublisher(taskID: String) -> AnyPublisher<TaskDetails, ServiceError>? {
        guard let host = host else {
            return AnyPublisher<TaskDetails, ServiceError>(Future<TaskDetails, ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.taskDetails(taskID).url(host: host))
    }

    public func fetchRepositorySourceDetails(owner: String, repository: String, buildKey: String) -> AnyPublisher<[BuildDetails], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[BuildDetails], ServiceError>(Future<[BuildDetails], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.repositorySourceBuilds(owner, repository, buildKey).url(host: host))
    }

    public func fetchMonitorQueuesPublisher() -> AnyPublisher<QueueSummaries, ServiceError>? {
        guard let host = host else {
            return AnyPublisher<QueueSummaries, ServiceError>(Future<QueueSummaries, ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.monitorQueues.url(host: host))
    }

    public func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[WorkerStatus], ServiceError>(Future<[WorkerStatus], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.monitorWorkerStatus.url(host: host))
    }

    public func fetchAdminTasksPublisher() -> AnyPublisher<[Task], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[Task], ServiceError>(Future<[Task], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.adminTasks.url(host: host))
    }

    public func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[TaskStatus], ServiceError>(Future<[TaskStatus], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.monitorActiveTasks.url(host: host))
    }

    public func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[BuildStatus], ServiceError>(Future<[BuildStatus], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.monitorActiveBuilds.url(host: host))
    }

    public func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, ServiceError>? {
        guard let host = host else {
            return AnyPublisher<ConfigDefaults, ServiceError>(Future<ConfigDefaults, ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.adminConfigDefaults.url(host: host))
    }

    public func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, ServiceError>? {
        guard let host = host else {
            return AnyPublisher<ConfigOverrides, ServiceError>(Future<ConfigOverrides, ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.adminConfigOverrides.url(host: host))
    }

    public func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[Queue], ServiceError>(Future<[Queue], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.adminQueues.url(host: host))
    }

    public func fetchHistoryBuildsPublisher() -> AnyPublisher<[BuildDetails], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[BuildDetails], ServiceError>(Future<[BuildDetails], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.historyBuilds.url(host: host))
    }

    public func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[TaskStatus], ServiceError>(Future<[TaskStatus], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.historyTasks.url(host: host))
    }

    public func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[HourlySummary], ServiceError>(Future<[HourlySummary], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.historyHourlySummary.url(host: host))
    }

    public func fetchBuildKeysPublisher(owner: String, repository: String, source: String) -> AnyPublisher<[BuildKey], ServiceError>? {
        guard let host = host else {
            return AnyPublisher<[BuildKey], ServiceError>(Future<[BuildKey], ServiceError> { promise in promise(.failure(.network(description: "Host not provided")))})
        }
        return request(url: StampedeAPIEndpoint.buildKeys(owner, repository, source).url(host: host))
    }
}
