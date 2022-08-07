//
//  MainViewModel.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import HouseKit

enum MainMenuItem: String, CaseIterable {
    case activeBuilds = "Active Builds"
    case activeTasks = "Active Tasks"
    case queues = "Queues"
    case historyBuilds = "Builds"
    case historyTasks = "Tasks"
    case settingsStampedeServer = "Stampede Server"
    case settingsRepositories = "Repositories"
    case settingsNotifications = "Notifications"
    case settingsInfo = "Info"
    case settingsDeveloper = "Developer"

    static let monitorItems: [MainMenuItem] = [.activeBuilds, .activeTasks, .queues]
    static let historyItems: [MainMenuItem] = [.historyBuilds, .historyTasks]
    static let settingsItems: [MainMenuItem] = {
        #if DEBUG
            return [MainMenuItem.settingsStampedeServer, MainMenuItem.settingsRepositories, MainMenuItem.settingsNotifications, MainMenuItem.settingsInfo, MainMenuItem.settingsDeveloper]
        #else
            return [MainMenuItem.settingsStampedeServer, MainMenuItem.settingsRepositories, MainMenuItem.settingsNotifications, MainMenuItem.settingsInfo]
        #endif
    }()
}

@MainActor
class MainViewModel: ObservableObject {

    public func viewModelFor(repository: Repository) -> RepositoryViewModel {
        RepositoryViewModel(repository: repository)
    }
}

#if DEBUG
extension MainViewModel {
    static let defaultViewModel = MainViewModel()
    static let loading = MainViewModel()
    static let networkError = MainViewModel()
    static let empty = MainViewModel()
}
#endif
