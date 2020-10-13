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
                switch viewModel.state {
                case .loading:
                    Text("Loading...")
                case .networkError:
                    Text("Network Error...")
                case .results(let repositories):
                    ForEach(repositories, id: \.self) { item in
                        Button(action: {
                            self.router.route(to: .repositoryDetails(item))
                        }, label: {
                            RepositoryCell(repository: item)
                        }).accessibilityIdentifier(item.id)
                    }
                }
            }
            Section(header: Text("Monitor")) {
                FeatureRouteCell(title: "Live", route: .monitorLive)
                FeatureRouteCell(title: "Active Builds", route: .monitorActiveBuilds)
                FeatureRouteCell(title: "Active Tasks", route: .monitorActiveTasks)
                FeatureRouteCell(title: "Queues", route: .monitorQueues)
            }
            Section(header: Text("History")) {
                FeatureRouteCell(title: "Builds", route: .historyBuilds)
                FeatureRouteCell(title: "Tasks", route: .historyTasks)
            }
            Section(header: Text("Settings")) {
                FeatureRouteCell(title: "Stampede Server", route: .settingsStampedeServer)
                FeatureRouteCell(title: "Repositories", route: .settingsRepositories)
                FeatureRouteCell(title: "Notifications", route: .settingsNotifications)
                FeatureRouteCell(title: "Info", route: .settingsInfo)
            }
        }.listStyle(GroupedListStyle())
    }
}

#if DEBUG

struct MainView_Previews: PreviewProvider {
    static var previews: some View {        
        Previewer {
            MainView()
                .environmentObject(MainViewModel(state: .results(Repository.someRepositories)))
        }
    }
}
#endif
