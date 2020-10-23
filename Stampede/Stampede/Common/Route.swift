//
//  Route.swift
//  Stampede
//
//  Created by David House on 10/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import UIKit

enum RouteMethod {
    case push
    case present
}

enum Route: Equatable {
    
    // Repository and Builds
    case repositoryDetails(_ repository: Repository)
    case buildDetails(_ buildStatus: BuildStatus)
    case buildDetailsFromID(_ buildID: String)
    case taskDetails(_ taskID: String)
    case repositorySourceDetails(_ repository: Repository, buildKey: String)
    case repositoryBuildDetails(_ repository: Repository, build: String)

    // Artifact
    case artifactCloc(taskID: String, title: String)

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
    case settingsDeveloper
    case settingsDeveloperPersona
    
    func featureController(_ dependencies: Dependencies) -> UIViewController {
        switch self {
        // Repository
        case .repositoryDetails(let repository):
            return RepositoryFeature.makeFeature(dependencies, repository: repository)
        case .buildDetails(let buildStatus):
            return BuildFeature.makeFeature(dependencies, build: buildStatus)
        case .buildDetailsFromID(let buildID):
            return BuildFeature.makeFeature(dependencies, buildID: buildID)
        case .taskDetails(let taskID):
            return BuildTaskFeature.makeFeature(dependencies, taskID: taskID)
        case .repositorySourceDetails(let repository, let buildKey):
            return RepositorySourceDetailsFeature.makeFeature(dependencies, repository: repository, buildKey: buildKey)
        case .repositoryBuildDetails(let repository, let build):
            return RepositoryBuildDetailsFeature.makeFeature(dependencies, repository: repository, build: build)

        // Artifact
        case .artifactCloc(let taskID, let title):
            return ArtifactClocFeature.makeFeature(dependencies, taskID: taskID, title: title)

        // Monitor
        case .monitorLive:
            return MonitorLiveFeature.makeFeature(dependencies)
        case .monitorActiveBuilds:
            return MonitorActiveBuildsFeature.makeFeature(dependencies)
        case .monitorActiveTasks:
            return MonitorActiveTasksFeature.makeFeature(dependencies)
        case .monitorQueues:
            return MonitorQueuesFeature.makeFeature(dependencies)

        // History
        case .historyTasks:
            return HistoryTasksFeature.makeFeature(dependencies)
        case .historyBuilds:
            return HistoryBuildsFeature.makeFeature(dependencies)

        // Settings
        case .settingsStampedeServer:
            return SettingsStampedeServerFeature.makeFeature(dependencies)
        case .settingsRepositories:
            return SettingsRepositoriesFeature.makeFeature(dependencies)
        case .settingsNotifications:
            return SettingsNotificationsFeature.makeFeature(dependencies)
        case .settingsInfo:
            return SettingsInfoFeature.makeFeature(dependencies)
        case .settingsDeveloper:
            return SettingsDeveloperFeature.makeFeature(dependencies)
        case .settingsDeveloperPersona:
            return SettingsDeveloperPersonaFeature.makeFeature(dependencies)
        }
    }
    
    static func fromURL(_ url: URL) -> Route? {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        switch url.path {
        case "/repositories/buildDetails":
            if let buildIDQueryItem = components?.queryItems?.filter({ $0.name == "buildID" }).first, let buildID = buildIDQueryItem.value {
                return .buildDetailsFromID(buildID)
            } else {
                return nil
            }
        default:
            return nil
        }
    }
}
