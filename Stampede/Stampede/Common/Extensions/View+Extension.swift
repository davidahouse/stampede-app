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

    #if DEBUG
    func previewDependencies() -> some View {
        return self
            .environmentObject(StampedeDefaults.someDefaults)
            .environmentObject(CurrentTheme())
            .environmentObject(RepositoryList(repositories: Repository.someRepositories, provider: RepositoryListFixtureProvider()))
            .environmentObject(StampedeService(provider: StampedeServiceFixtureProvider()))
    }
    
    func colorSchemePreview(_ colorScheme: ColorScheme) -> some View {
        return self
            .colorScheme(colorScheme)
            .previewLayout(.sizeThatFits)
            .previewDependencies()
    }
 
    func sizeCategoryPreview(_ sizeCategory: ContentSizeCategory) -> some View {
        return self
            .colorScheme(.light)
            .environment(\.sizeCategory, sizeCategory)
            .previewLayout(.sizeThatFits)
            .previewDependencies()
    }
    #endif
    
    func withNavigationDestinations() -> some View {
        self
            .navigationDestination(for: Repository.self, destination: { repository in
                RepositoryView(repository: repository)
            })
            .navigationDestination(for: BuildStatus.self, destination: { buildStatus in
                BuildView(buildID: buildStatus.id, state: .results(buildStatus))
            })
            .navigationDestination(for: TaskStatus.self, destination: { task in
                BuildTaskView(taskID: task.id)
            })
            .navigationDestination(for: BuildDetails.self, destination: { details in
                BuildView(buildID: details.build_id)
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
