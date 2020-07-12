//
//  StampedeServicePreviewProvider.swift
//  Stampede
//
//  Created by David House on 12/21/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine

#if DEBUG

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public class StampedeServicePreviewProvider: StampedeServiceProvider {

    public let hostPassthroughSubject = PassthroughSubject<String, Never>()

    public func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], StampedeError>? {
        return nil
    }

    public func fetchRecentBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], StampedeError>? {
        return nil
    }

    public func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], StampedeError>? {
        return nil
    }

    public func fetchAdminTasksPublisher() -> AnyPublisher<[Task], StampedeError>? {
        return nil
    }

    public func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, StampedeError>? {
        return nil
    }

    public func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, StampedeError>? {
        return nil
    }

    public func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], StampedeError>? {
        return nil
    }

    public func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], StampedeError>? {
        return nil
    }

    public func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], StampedeError>? {
        return nil
    }

    public func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>? {
        return nil
    }

    public func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], StampedeError>? {
        return nil
    }

    public func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], StampedeError>? {
        return nil
    }

    public func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>? {
        return nil
    }
}

#endif
