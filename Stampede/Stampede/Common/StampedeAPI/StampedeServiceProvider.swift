//
//  StampedeServiceProvider.swift
//  Stampede
//
//  Created by David House on 12/21/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public protocol StampedeServiceProvider {

    var hostPassthroughSubject: PassthroughSubject<String, Never> { get }

    // Repository
    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], StampedeError>?
    func fetchRecentBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], StampedeError>?
    func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], StampedeError>?

    // Monitor
    func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], StampedeError>?
    func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], StampedeError>?
    func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], StampedeError>?
    func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>?

    // History
    func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>?
    func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], StampedeError>?

    // Admin
    func fetchAdminTasksPublisher() -> AnyPublisher<[Task], StampedeError>?
    func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, StampedeError>?
    func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, StampedeError>?
    func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], StampedeError>?
}
