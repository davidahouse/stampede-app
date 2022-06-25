//
//  View+Extension.swift
//  Stampede
//
//  Created by David House on 12/21/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import SwiftUI

extension View {

    func dependenciesToEnvironment(_ dependencies: Dependencies) -> some View {
        return self
            .environmentObject(dependencies.theme)
            .environmentObject(dependencies.service)
    }

    #if DEBUG
    func previewDependencies() -> some View {
        return self
            .environmentObject(StampedeDefaults.someDefaults)
            .environmentObject(CurrentTheme())
            .environmentObject(RepositoryListFixture())
            .environmentObject(StampedeService(provider: StampedeServiceFixtureProvider()))
    }
    #endif
    
    func withNavigationDestinations() -> some View {
        self
            .navigationDestination(for: Repository.self, destination: { repository in
                RepositoryView(repository: repository)
            })
            .navigationDestination(for: BuildStatus.self, destination: { buildStatus in
                BuildView(state: .results(buildStatus))
            })
            .navigationDestination(for: TaskStatus.self, destination: { task in
                BuildTaskView(taskID: task.id)
            })
            .navigationDestination(for: MainMenuItem.self, destination: { menuItem in
                switch menuItem {
                case .activeBuilds:
                    MonitorActiveBuildsView()
                case .activeTasks:
                    MonitorActiveTasksView()
                case .queues:
                    MonitorQueuesView()
                case .historyBuilds:
                    HistoryBuildsView()
                case .historyTasks:
                    HistoryTasksView()
                case .settingsStampedeServer:
                    SettingsStampedeServerView()
                case .settingsRepositories:
                    SettingsRepositoriesView()
                case .settingsNotifications:
                    SettingsNotificationsView()
                case .settingsInfo:
                    SettingsInfoView()
                case .settingsDeveloper:
                    SettingsDeveloperView()
                }
            })
    }
}
