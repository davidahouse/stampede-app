//
//  StampedeServiceNetworkProvider.swift
//  Stampede
//
//  Created by David House on 12/21/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public class StampedeServiceNetworkProvider: StampedeServiceProvider {

    let session: URLSession
    private var disposables = Set<AnyCancellable>()

    public let hostPassthroughSubject = PassthroughSubject<String, Never>()
    private var host: String?
    private var hostSink: AnyCancellable?

    public init(host: String? = nil, session: URLSession? = nil) {
        self.host = host
        if let session = session {
            self.session = session
        } else {
            self.session = URLSession(configuration: URLSessionConfiguration.default)
        }
        hostSink = hostPassthroughSubject.sink(receiveValue: { value in
            self.host = value
        })
    }

    public func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], StampedeError>? {
        return request(endpoint: .repositories)
    }

    public func fetchRecentBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], StampedeError>? {
        return request(endpoint: .recentBuilds(owner, repository))
    }

    public func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], StampedeError>? {
        return request(endpoint: .repositoryBuilds(owner, repository))
    }

    public func fetchMonitorQueuesPublisher() -> AnyPublisher<[QueueSummary], StampedeError>? {
        return request(endpoint: .monitorQueues)
    }

    public func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], StampedeError>? {
        return request(endpoint: .monitorWorkerStatus)
    }

    public func fetchAdminTasksPublisher() -> AnyPublisher<[Task], StampedeError>? {
        return request(endpoint: .adminTasks)
    }

    public func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>? {
        return request(endpoint: .monitorActiveTasks)
    }

    public func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], StampedeError>? {
        return request(endpoint: .monitorActiveBuilds)
    }

    public func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, StampedeError>? {
        return request(endpoint: .adminConfigDefaults)
    }

    public func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, StampedeError>? {
        return request(endpoint: .adminConfigOverrides)
    }

    public func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], StampedeError>? {
        return request(endpoint: .adminQueues)
    }

    public func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], StampedeError>? {
        return request(endpoint: .historyTasks)
    }

    public func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], StampedeError>? {
        return request(endpoint: .historyHourlySummary)
    }

    private func request<T: Decodable>(endpoint: StampedeAPIEndpoint) -> AnyPublisher<T, StampedeError> {
        guard let host = host else {
            let publisher = AnyPublisher<T, StampedeError>(Fail<T, StampedeError>(error: StampedeError.network(description: "Host not set yet")))
            return publisher
        }

        let url = endpoint.url(host: host)
        debugPrint(">>> \(url)")

        let publisher: AnyPublisher<T, StampedeError> =
            session.dataTaskPublisher(for: URLRequest(url: url))
              .mapError { error in
                .network(description: error.localizedDescription)
              }
              .flatMap(maxPublishers: .max(1)) { pair in
                
                decode(pair.data)
              }
                .receive(on: RunLoop.main)
              .eraseToAnyPublisher()
        return publisher
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, StampedeError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .formatted(Constants.iso8601Full)
  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
        if let decodingError = error as? DecodingError {
            switch decodingError {
            case .dataCorrupted(let context):
                return .parsing(description: "Data corrupted error \(context.debugDescription)")
            case .typeMismatch(let typeMismatch, let context):
                return .parsing(description: "Type \(typeMismatch) mismatch: \(context.debugDescription) in path: \(context.codingPath)")
            default:
                return .parsing(description: "\(decodingError)")
            }
        } else {
            return .parsing(description: error.localizedDescription)
        }
    }
    .eraseToAnyPublisher()
}
