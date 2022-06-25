//
//  Routes.swift
//  Stampede
//
//  Created by David House on 11/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

struct EmptyRoute: Route {
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return UIViewController()
    }
    
    func makeView() -> any View {
        EmptyView()
    }
}

class Routes: ObservableObject {

//    func route(for repository: Repository) -> Route {
//        return RepositoryRoute(repository: repository)
//    }

    func route(for menuItem: MainMenuItem) -> Route {
        switch menuItem {
        case .activeBuilds:
            return MonitorActiveBuildsRoute()
        case .activeTasks:
            return MonitorActiveTasksRoute()
        case .queues:
            return MonitorQueuesRoute()
        case .historyBuilds:
            return HistoryBuildsRoute()
        case .historyTasks:
            return HistoryTasksRoute()
        case .settingsStampedeServer:
            return SettingsStampedeServerRoute()
        case .settingsRepositories:
            return SettingsRepositoriesRoute()
        case .settingsNotifications:
            return SettingsNotificationsRoute()
        case .settingsInfo:
            return SettingsInfoRoute()
        case .settingsDeveloper:
            return SettingsDeveloperRoute()
        }
    }

    func routeForTask(_ taskID: String) -> Route {
        return BuildTaskRoute(taskID: taskID)
    }

    func routeForRepositoryBuild(_ repository: Repository, build: String) -> Route {
        return RepositoryBuildDetailsRoute(repository: repository, build: build)
    }

    func routeForRepositorySourceDetails(_ repository: Repository, buildKey: String) -> Route {
        return RepositorySourceDetailsRoute(repository: repository, buildKey: buildKey)
    }

    func routeSettingsDeveloperPersonaRoute() -> Route {
        return SettingsDeveloperPersonaRoute()
    }

    func routeForArtifact(_ taskID: String, artifact: TaskArtifact) -> Route {
        switch artifact.type {
        default:
            return EmptyRoute()
        }
    }
}
