//
//  StampedeAPIEndpoint.swift
//  Stampede-Mobile
//
//  Created by David House on 10/20/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public enum StampedeAPIEndpoint {
    // Repository
    case repositories
    case activeBuilds(String, String)
    case repositoryBuilds(String, String)
    case buildKeys(String, String, String)
    case buildDetails(String)
    case taskDetails(String)
    case repositorySourceBuilds(String, String, String)

    // Artifacts
    case artifactContents(String, String)
    // Monitor
    case monitorActiveBuilds
    case monitorActiveTasks
    case monitorWorkerStatus
    case monitorQueues
    // History
    case historyBuilds
    case historyTasks
    case historyHourlySummary
    // Admin
    case adminTasks
    case adminConfigDefaults
    case adminConfigOverrides
    case adminQueues

    public func url(host: String) -> URL {
        switch self {
        // Repository
        case .repositories:
            return URL(string: "\(host)/api/repositories")!
        case let .activeBuilds(owner, repository):
            return URL(string: "\(host)/api/repository/activeBuilds?owner=\(owner)&repository=\(repository)")!
        case let .repositoryBuilds(owner, repository):
            return URL(string: "\(host)/api/repository/repositoryBuilds?owner=\(owner)&repository=\(repository)")!
        case let .buildKeys(owner, repository, source):
            return URL(string: "\(host)/api/repository/buildKeys?owner=\(owner)&repository=\(repository)&source=\(source)")!
        case let .buildDetails(buildID):
            return URL(string: "\(host)/api/repository/buildDetails?buildID=\(buildID)")!
        case let .taskDetails(taskID):
            return URL(string: "\(host)/api/repository/taskDetails?taskID=\(taskID)")!
        case let .repositorySourceBuilds(owner, repository, buildKey):
            return URL(string: "\(host)/api/repository/repositorySourceBuilds?owner=\(owner)&repository=\(repository)&build_key=\(buildKey)")!

        // Artifacts
        case .artifactContents(let taskID, let title):
            let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return URL(string: "\(host)/api/repository/taskArtifactContents?taskID=\(taskID)&title=\(encodedTitle)")!

        // Monitor
        case .monitorActiveBuilds:
            return URL(string: "\(host)/api/monitor/activeBuilds")!
        case .monitorActiveTasks:
            return URL(string: "\(host)/api/monitor/activeTasks")!
        case .monitorWorkerStatus:
            return URL(string: "\(host)/api/monitor/workerStatus")!
        case .monitorQueues:
            return URL(string: "\(host)/api/monitor/queueSummary")!

        // History
        case .historyBuilds:
            return URL(string: "\(host)/api/history/builds")!
        case .historyTasks:
            return URL(string: "\(host)/api/history/tasks")!
        case .historyHourlySummary:
            return URL(string: "\(host)/api/history/hourlySummary")!

        // Admin
        case .adminTasks:
            return URL(string: "\(host)/api/admin/tasks")!
        case .adminConfigDefaults:
            return URL(string: "\(host)/api/admin/configDefaults")!
        case .adminConfigOverrides:
            return URL(string: "\(host)/api/admin/configOverrides")!
        case .adminQueues:
            return URL(string: "\(host)/api/admin/queues")!
        }
    }
}
