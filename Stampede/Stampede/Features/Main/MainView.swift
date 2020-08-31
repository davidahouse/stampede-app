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

    @ObservedObject var viewModel: MainViewModel

    init(viewModel: MainViewModel, publisher: AnyPublisher<[Repository], ServiceError>? = nil) {
        self.viewModel = viewModel
        self.viewModel.publisher = publisher
    }
    
    // MARK: - Environment

    @EnvironmentObject var theme: CurrentTheme

    // MARK: - Properties

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Repositories")) {
                switch viewModel.state {
                case .loading, .networkError:
                    EmptyView()
                case .results(let repositories):
                    ForEach(repositories, id: \.self) { item in
                        NavigationLink(destination: RepositoryFeature(repository: item)) {
                            RepositoryCell(repository: item)
                        }
                    }
                }
            }
            Section(header: Text("Monitor")) {
                NavigationLink(destination: MonitorLiveFeature()) {
                    Text("Live")
                }
                NavigationLink(destination: MonitorActiveBuildsFeature()) {
                    Text("Active Builds")
                }
                NavigationLink(destination: MonitorActiveTasksFeature()) {
                    Text("Active Tasks")
                }
                NavigationLink(destination: MonitorQueuesFeature()) {
                    Text("Queues")
                }
            }
            Section(header: Text("History")) {
                NavigationLink(destination: HistoryBuildsFeature()) {
                    Text("Builds")
                }
                NavigationLink(destination: HistoryTasksFeature()) {
                    Text("Tasks")
                }
            }
            Section(header: Text("Settings")) {
                NavigationLink(destination: SettingsStampedeServerFeature()) {
                    Text("Stampede Server")
                }
                NavigationLink(destination: SettingsRepositoriesFeature()) {
                    Text("Repositories")
                }
                NavigationLink(destination: SettingsNotificationsFeature()) {
                    Text("Notifications")
                }
                NavigationLink(destination: SettingsInfoFeature()) {
                    Text("Info")
                }
            }
        }.listStyle(SidebarListStyle())
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
