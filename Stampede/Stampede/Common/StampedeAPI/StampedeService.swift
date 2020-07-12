//
//  StampedeService.swift
//  Stampede
//
//  Created by David House on 10/12/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public class StampedeService: ObservableObject, StampedeServiceProvider {

    let provider: StampedeServiceProvider
    let session: URLSession
    public var hostPassthroughSubject: PassthroughSubject<String, Never> {
        return provider.hostPassthroughSubject
    }

    public init(host: String? = nil, session: URLSession? = nil, provider: StampedeServiceProvider? = nil) {
        if let session = session {
            self.session = session
        } else {
            self.session = URLSession(configuration: URLSessionConfiguration.default)
        }
        if let provider = provider {
            self.provider = provider
        } else {
            self.provider = StampedeServiceNetworkProvider(host: host, session: session)
        }
    }

    public func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], StampedeError>? {
        return provider.fetchRepositoriesPublisher()
    }

    public func fetchRecentBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], StampedeError>? {
        return provider.fetchRecentBuildsPublisher(owner: owner, repository: repository)
    }

    public func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], StampedeError>? {
        return provider.fetchRepositoryBuildsPublisher(owner: owner, repository: repository)
    }

    public func fetchAdminTasksPublisher() -> AnyPublisher<[Task], StampedeError>? {
        return provider.fetchAdminTasksPublisher()
    }

    public func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, StampedeError>? {
        return provider.fetchAdminConfigDefaultsPublisher()
    }

    public func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, StampedeError>? {
        return provider.fetchAdminConfigOverridesPublisher()
    }

    public func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], StampedeError>? {
        return provider.fetchAdminQueuesPublisher()
    }

    public func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], StampedeError>? {
        return provider.fetchMonitorQueuesPublisher()
    }

    public func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], StampedeError>? {
        return provider.fetchWorkerStatusPublisher()
    }
    
    public func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>? {
        return provider.fetchActiveTasksPublisher()
    }

    public func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], StampedeError>? {
        return provider.fetchActiveBuildsPublisher()
    }

    public func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>? {
        return provider.fetchHistoryTasksPublisher()
    }

    public func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], StampedeError>? {
        return provider.fetchHistoryHourlySummaryPublisher()
    }

}
