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

    var provider: StampedeServiceProvider

    public init(host: String? = nil, provider: StampedeServiceProvider) {
        self.provider = provider
        self.stampedeServerURL = host ?? ""
        self.persona = "None"
    }
    
    @Published var stampedeServerURL: String {
        didSet {
            provider.setHost(stampedeServerURL)
            print("new server URL: \(stampedeServerURL)")
        }
    }
    
    @Published var persona: String {
        didSet {
            if persona == "None" {
                provider = StampedeServiceNetworkProvider(host: stampedeServerURL)
            } else {
                provider = StampedeServiceFixtureProvider(host: "fixtures", persona: StampedeServiceFixtureProvider.fromString(persona))
            }
        }
    }

    // Repository
    func fetchRepositories() async -> ViewModelState<[Repository]> {
        do {
            let data = try await provider.fetchRepositories()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchActiveBuilds(owner: String, repository: String) async -> ViewModelState<[BuildStatus]> {
        do {
            let data = try await provider.fetchActiveBuilds(owner: owner, repository: repository)
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchRepositoryBuilds(owner: String, repository: String) async -> ViewModelState<[RepositoryBuild]> {
        do {
            let data = try await provider.fetchRepositoryBuilds(owner: owner, repository: repository)
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchBuildKeys(owner: String, repository: String, source: String) async -> ViewModelState<[BuildKey]> {
        do {
            let data = try await provider.fetchBuildKeys(owner: owner, repository: repository, source: source)
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchBuildDetails(buildID: String) async -> ViewModelState<BuildStatus> {
        do {
            let data = try await provider.fetchBuildDetails(buildID: buildID)
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchTaskDetails(taskID: String) async -> ViewModelState<TaskDetails> {
        do {
            let data = try await provider.fetchTaskDetails(taskID: taskID)
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchRepositorySourceDetails(owner: String, repository: String, buildKey: String) async -> ViewModelState<[BuildDetails]> {
        do {
            let data = try await provider.fetchRepositorySourceDetails(owner: owner, repository: repository, buildKey: buildKey)
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }

    // Monitor
    func fetchActiveBuilds() async -> ViewModelState<[BuildStatus]> {
        do {
            let data = try await provider.fetchActiveBuilds()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchMonitorQueues() async -> ViewModelState<QueueSummaries> {
        do {
            let data = try await provider.fetchMonitorQueues()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchWorkerStatus() async -> ViewModelState<[WorkerStatus]> {
        do {
            let data = try await provider.fetchWorkerStatus()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchActiveTasks() async -> ViewModelState<[TaskStatus]> {
        do {
            let data = try await provider.fetchActiveTasks()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }

    // History
    func fetchHistoryBuilds() async -> ViewModelState<[BuildDetails]> {
        do {
            let data = try await provider.fetchHistoryBuilds()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchHistoryTasks() async -> ViewModelState<[TaskStatus]> {
        do {
            let data = try await provider.fetchHistoryTasks()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchHistoryHourlySummary() async -> ViewModelState<[HourlySummary]> {
        do {
            let data = try await provider.fetchHistoryHourlySummary()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }

    // Admin
    func fetchAdminTasks() async -> ViewModelState<[Task]> {
        do {
            let data = try await provider.fetchAdminTasks()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchAdminConfigDefaults() async -> ViewModelState<ConfigDefaults> {
        do {
            let data = try await provider.fetchAdminConfigDefaults()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchAdminConfigOverrides() async -> ViewModelState<ConfigOverrides> {
        do {
            let data = try await provider.fetchAdminConfigOverrides()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
    
    func fetchAdminQueues() async -> ViewModelState<[Queue]> {
        do {
            let data = try await provider.fetchAdminQueues()
            return .results(data)
        } catch {
            // TODO: Ideally we should have a way to return just the error without
            // converting to the more generic networkError from ServiceError
            return .networkError(.network(description: error.localizedDescription))
        }
    }
}
