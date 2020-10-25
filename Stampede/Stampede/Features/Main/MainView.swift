//
//  MainView.swift
//  Stampede-Mobile
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//
import SwiftUI
import Combine
import HouseKit

struct MainView: View {

    // MARK: - Environment

    @EnvironmentObject var theme: CurrentTheme
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var router: Router

    // MARK: - Private properties

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Repositories")) {
                BaseView(viewModel: viewModel, content: { repositories in
                    ForEach(repositories, id: \.self) { item in
                        Button(action: {
                            self.router.route(to: RepositoryRoute(repository: item))
                        }, label: {
                            RepositoryCell(repository: item)
                        }).accessibilityIdentifier(item.id)
                    }
                })
            }
            Section(header: Text("Monitor")) {
                FeatureRouteCell(title: "Live", route: MonitorLiveRoute())
                FeatureRouteCell(title: "Active Builds", route: MonitorActiveBuildsRoute())
                FeatureRouteCell(title: "Active Tasks", route: MonitorActiveTasksRoute())
                FeatureRouteCell(title: "Queues", route: MonitorQueuesRoute())
            }
            Section(header: Text("History")) {
                FeatureRouteCell(title: "Builds", route: HistoryBuildsRoute())
                FeatureRouteCell(title: "Tasks", route: HistoryTasksRoute())
            }
            Section(header: Text("Settings")) {
                FeatureRouteCell(title: "Stampede Server", route: SettingsStampedeServerRoute())
                FeatureRouteCell(title: "Repositories", route: SettingsRepositoriesRoute())
                FeatureRouteCell(title: "Notifications", route: SettingsNotificationsRoute())
                FeatureRouteCell(title: "Info", route: SettingsInfoRoute())
                #if DEBUG
                FeatureRouteCell(title: "Developer", route: SettingsDeveloperRoute())
                #endif
            }
        }.listStyle(GroupedListStyle())
    }
}

#if DEBUG

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Previewer {
                MainView()
                    .environmentObject(MainViewModel(state: .results(Repository.someRepositories)))
            }
            DevicePreviewer {
                MainView()
                    .environmentObject(MainViewModel(state: .results(Repository.someRepositories)))
            }
        }
    }
}
#endif
