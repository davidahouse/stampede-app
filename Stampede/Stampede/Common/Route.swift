//
//  Route.swift
//  Stampede
//
//  Created by David House on 10/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import UIKit

protocol Router: class {
    func route(to: Route)
}

enum Route {
    
    // Repository and Builds
    case repositoryDetails(_ repository: Repository)
    case buildDetails(_ buildStatus: BuildStatus)
    case taskDetails(_ task: TaskStatus)
    
    // Monitor
    case monitorLive
    case monitorActiveBuilds
    case monitorActiveTasks
    case monitorQueues
    
    // History
    case historyTasks
    case historyBuilds
    
    // Settings
    case settingsStampedeServer
    case settingsRepositories
    case settingsNotifications
    case settingsInfo
    
    func featureController(_ dependencies: Dependencies) -> UIViewController {
        switch self {
        case .repositoryDetails(let repository):
            return RepositoryFeature.makeFeature(dependencies, repository: repository)
        case .buildDetails(let buildStatus):
            return BuildFeature.makeFeature(dependencies, build: buildStatus)
        case .taskDetails(let task):
            return BuildTaskFeature.makeFeature(dependencies, task: task)
        case .monitorLive:
            return MonitorLiveFeature.makeFeature(dependencies)
        case .monitorActiveBuilds:
            return MonitorActiveBuildsFeature.makeFeature(dependencies)
        case .monitorActiveTasks:
            return MonitorActiveTasksFeature.makeFeature(dependencies)
        case .monitorQueues:
            return MonitorQueuesFeature.makeFeature(dependencies)
        case .historyTasks:
            return HistoryTasksFeature.makeFeature(dependencies)
        case .historyBuilds:
            return HistoryBuildsFeature.makeFeature(dependencies)
        case .settingsStampedeServer:
            return SettingsStampedeServerFeature.makeFeature(dependencies)
        case .settingsRepositories:
            return SettingsRepositoriesFeature.makeFeature(dependencies)
        case .settingsNotifications:
            return SettingsNotificationsFeature.makeFeature(dependencies)
        case .settingsInfo:
            return SettingsInfoFeature.makeFeature(dependencies)
        }
    }
}
