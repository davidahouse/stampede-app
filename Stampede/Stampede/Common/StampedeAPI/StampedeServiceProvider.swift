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
    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError>?
    func fetchActiveBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], ServiceError>?
    func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], ServiceError>?
    func fetchBuildKeysPublisher(owner: String, repository: String, source: String) -> AnyPublisher<[BuildKey], ServiceError>?
    func fetchBuildDetailsPublisher(buildID: String) -> AnyPublisher<BuildStatus, ServiceError>?
    func fetchTaskDetailsPublisher(taskID: String) -> AnyPublisher<TaskDetails, ServiceError>?

    // Monitor
    func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], ServiceError>?
    func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], ServiceError>?
    func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], ServiceError>?
    func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>?

    // History
    func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>?
    func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], ServiceError>?

    // Admin
    func fetchAdminTasksPublisher() -> AnyPublisher<[Task], ServiceError>?
    func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, ServiceError>?
    func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, ServiceError>?
    func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], ServiceError>?
}
