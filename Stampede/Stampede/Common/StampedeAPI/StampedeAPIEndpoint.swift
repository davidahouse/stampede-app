//
//  StampedeAPIEndpoint.swift
//  Stampede-Mobile
//
//  Created by David House on 10/20/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public enum StampedeAPIEndpoint {
    case repositories
    case recentBuilds(String, String)
    case repositoryBuilds(String, String)
    case monitorActiveBuilds
    case monitorActiveTasks
    case monitorWorkerStatus
    case monitorQueues
    case historyTasks
    case historyHourlySummary
    case adminTasks
    case adminConfigDefaults
    case adminConfigOverrides
    case adminQueues

    public func url(host: String) -> URL {
        switch self {
        case .repositories:
            return URL(string: "\(host)/api/repositories")!
        case let .recentBuilds(owner, repository):
            return URL(string: "\(host)/api/repository/recentBuilds?owner=\(owner)&repository=\(repository)")!
        case let .repositoryBuilds(owner, repository):
            return URL(string: "\(host)/api/repository/repositoryBuilds?owner=\(owner)&repository=\(repository)")!
        case .monitorActiveBuilds:
            return URL(string: "\(host)/api/monitor/activeBuilds")!
        case .monitorActiveTasks:
            return URL(string: "\(host)/api/monitor/activeTasks")!
        case .monitorWorkerStatus:
            return URL(string: "\(host)/api/monitor/workerStatus")!
        case .monitorQueues:
            return URL(string: "\(host)/api/monitor/queueSummary")!
        case .historyTasks:
            return URL(string: "\(host)/api/history/tasks")!
        case .historyHourlySummary:
            return URL(string: "\(host)/api/history/hourlySummary")!
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
