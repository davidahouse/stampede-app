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

    var persona: Persona!

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
    var fetchBuildDetailsPublisherCalled = false
    var fetchTaskDetailsPublisherCalled = false
    var fetchArtifactClocPublisherCalled = false
    var fetchArtifactXcodebuildPublisherCalled = false
    var fetchHistoryBuildsPublisherCalled = false
    var fetchRepositorySourceBuildsPublisherCalled = false

    var hostPassthroughSubject: PassthroughSubject<String, Never> = PassthroughSubject<String, Never>()

    private var host: String?
    private var hostSink: AnyCancellable?

    public init(host: String? = nil, persona: Persona? = HappyPersona()) {
        self.host = host
        self.persona = persona
        super.init()
        hostSink = hostPassthroughSubject.sink(receiveValue: { value in
           self.host = value
        })
    }

    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError>? {
        fetchRepositoriesPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.repositories)
    }
    
    func fetchActiveBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[BuildStatus], ServiceError>? {
        fetchActiveBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.repositoryActiveBuilds)
    }
    
    func fetchRepositoryBuildsPublisher(owner: String, repository: String) -> AnyPublisher<[RepositoryBuild], ServiceError>? {
        fetchRepositoryBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.repositoryBuilds)
    }
    
    func fetchBuildDetailsPublisher(buildID: String) -> AnyPublisher<BuildStatus, ServiceError>? {
        fetchBuildDetailsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.buildDetails)
    }

    func fetchTaskDetailsPublisher(taskID: String) -> AnyPublisher<TaskDetails, ServiceError>? {
        fetchTaskDetailsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.taskDetails)
    }

    func fetchRepositorySourceDetails(owner: String, repository: String, buildKey: String) -> AnyPublisher<[BuildDetails], ServiceError>? {
        fetchRepositorySourceBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.repositorySourceBuilds)
    }

    func fetchArtifactClocPublisher(taskID: String, title: String) -> AnyPublisher<ArtifactCloc, ServiceError>? {
        fetchArtifactClocPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.artifactCloc)
    }

    func fetchArtifactXcodebuildPublisher(taskID: String, title: String) -> AnyPublisher<ArtifactXcodebuild, ServiceError>? {
        fetchArtifactXcodebuildPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.artifactXcodebuild)
    }

    func fetchActiveBuildsPublisher() -> AnyPublisher<[BuildStatus], ServiceError>? {
        fetchActiveBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.activeBuilds)
    }
    
    func fetchMonitorQueuesPublisher() -> AnyPublisher<QueueSummaries, ServiceError>? {
        fetchMonitorQueuesPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.queues)
    }
    
    func fetchWorkerStatusPublisher() -> AnyPublisher<[WorkerStatus], ServiceError>? {
        fetchWorkerStatusPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.workerStatus)
    }
    
    func fetchActiveTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        fetchActiveTasksPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.activeTasks)
    }

    func fetchHistoryBuildsPublisher() -> AnyPublisher<[BuildDetails], ServiceError>? {
        fetchHistoryBuildsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.historyBuilds)
    }

    func fetchHistoryTasksPublisher() -> AnyPublisher<[TaskStatus], ServiceError>? {
        fetchHistoryTasksPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.historyTasks)
    }
    
    func fetchHistoryHourlySummaryPublisher() -> AnyPublisher<[HourlySummary], ServiceError>? {
        fetchHistoryHourlySummaryPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.hourlySummary)
    }
    
    func fetchAdminTasksPublisher() -> AnyPublisher<[Task], ServiceError>? {
        fetchAdminTasksPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.tasks)
    }
    
    func fetchAdminConfigDefaultsPublisher() -> AnyPublisher<ConfigDefaults, ServiceError>? {
        fetchAdminConfigDefaultsPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.configDefaults)
    }
    
    func fetchAdminConfigOverridesPublisher() -> AnyPublisher<ConfigOverrides, ServiceError>? {
        fetchAdminConfigOverridesPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.configOverrides)
    }
    
    func fetchAdminQueuesPublisher() -> AnyPublisher<[Queue], ServiceError>? {
        fetchAdminQueuesPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.configQueues)
    }

    func fetchBuildKeysPublisher(owner: String, repository: String, source: String) -> AnyPublisher<[BuildKey], ServiceError>? {
        fetchBuildKeysPublisherCalled = true
        guard let host = host, !host.contains("error") else {
            return fetchPublisher(.error(.network(description: "some network error happened")))
        }
        return fetchPublisher(persona.buildKeys)
    }
}

extension StampedeServiceFixtureProvider {

    static func fromString(_ persona: String) -> Persona {
        switch persona {
        case "Happy":
            return HappyPersona()
        case "Error":
            return ErrorPersona()
        case "Loading":
            return LoadingPersona()
        case "ErrorBuildDetails":
            return ErrorBuildDetailsPersona()
        default:
            return HappyPersona()
        }
    }
}
#endif
