//
//  StampedeService.swift
//  Stampede
//
//  Created by David House on 10/12/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public class StampedeService: ObservableObject {

    let provider: StampedeServiceProvider
    public var hostPassthroughSubject: PassthroughSubject<String, Never> {
        return provider.hostPassthroughSubject
    }

    public init(host: String? = nil, provider: StampedeServiceProvider) {
        self.provider = provider
    }

    public func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError>? {
        return provider.fetchRepositoriesPublisher()
    }

    public func fetchActiveBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], ServiceError>? {
        return provider.fetchActiveBuildsPublisher(owner: owner, repository: repository)
    }

    public func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], ServiceError>? {
        return provider.fetchRepositoryBuildsPublisher(owner: owner, repository: repository)
    }

    public func fetchBuildKeysPublisher(owner: String, repository: String, source: String) -> AnyPublisher<[BuildKey], ServiceError>? {
        return provider.fetchBuildKeysPublisher(owner: owner, repository: repository, source: source)
    }
    
    public func fetchBuildDetailsPublisher(buildID: String) -> AnyPublisher<BuildStatus, ServiceError>? {
        return provider.fetchBuildDetailsPublisher(buildID: buildID)
    }

    public func fetchTaskDetailsPublisher(taskID: String) -> AnyPublisher<TaskDetails, ServiceError>? {
        return provider.fetchTaskDetailsPublisher(taskID: taskID)
    }

    public func fetchAdminTasksPublisher() -> AnyPublisher<[Task], ServiceError>? {
        return provider.fetchAdminTasksPublisher()
    }

    public func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, ServiceError>? {
        return provider.fetchAdminConfigDefaultsPublisher()
    }

    public func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, ServiceError>? {
        return provider.fetchAdminConfigOverridesPublisher()
    }

    public func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], ServiceError>? {
        return provider.fetchAdminQueuesPublisher()
    }

    public func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], ServiceError>? {
        return provider.fetchMonitorQueuesPublisher()
    }

    public func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], ServiceError>? {
        return provider.fetchWorkerStatusPublisher()
    }
    
    public func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        return provider.fetchActiveTasksPublisher()
    }

    public func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], ServiceError>? {
        return provider.fetchActiveBuildsPublisher()
    }

    public func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        return provider.fetchHistoryTasksPublisher()
    }

    public func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], ServiceError>? {
        return provider.fetchHistoryHourlySummaryPublisher()
    }

}
