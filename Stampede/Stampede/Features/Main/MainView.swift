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

    // MARK: - View Model
    
    @ObservedObject var viewModel: MainViewModel

    // MARK: - Environment

    @EnvironmentObject var theme: CurrentTheme
    
    // MARK: - Private properties
    
    private let router: Router?

    // MARK: - Initializer
    
    init(viewModel: MainViewModel, router: Router? = nil) {
        self.viewModel = viewModel
        self.router = router
    }
    
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
                            self.router?.route(to: .repositoryDetails(item))
                        }, label: {
                            RepositoryCell(repository: item)
                        }).accessibilityIdentifier(item.id)
                    }
                }
            }
            Section(header: Text("Monitor")) {
                Button("Live", action: {
                    router?.route(to: .monitorLive)
                })
                    .accessibility(identifier: "monitor-live")
                Button("Active Builds", action: {
                    router?.route(to: .monitorActiveBuilds)
                })
                    .accessibility(identifier: "monitor-active-builds")
                Button("Active Tasks", action: {
                    router?.route(to: .monitorActiveTasks)
                })
                    .accessibility(identifier: "monitor-active-tasks")
                Button("Queues", action: {
                    router?.route(to: .monitorActiveTasks)
                })
                    .accessibility(identifier: "monitor-queues")
            }
            Section(header: Text("History")) {
                Button("Builds", action: {
                    router?.route(to: .historyBuilds)
                })
                    .accessibility(identifier: "history-builds")
                Button("Tasks", action: {
                    router?.route(to: .historyTasks)
                })
                    .accessibility(identifier: "history-tasks")
            }
            Section(header: Text("Settings")) {
                Button("Stampede Server", action: {
                    router?.route(to: .settingsStampedeServer)
                })
                    .accessibility(identifier: "settings-stampede-server")
                Button("Repositories", action: {
                    router?.route(to: .settingsRepositories)
                })
                .accessibility(identifier: "settings-repositories")
                Button("Notifications", action: {
                    router?.route(to: .settingsNotifications)
                }).accessibility(identifier: "settings-notifications")
                Button("Info", action: {
                    router?.route(to: .settingsInfo)
                }).accessibility(identifier: "settings-info")
            }
        }.listStyle(GroupedListStyle())
    }
}

#if DEBUG

struct MainView_Previews: PreviewProvider {
    static var previews: some View {        
        Previewer {
            MainView(viewModel: MainViewModel(state: .results(Repository.someRepositories)))
        }
    }
}
#endif
