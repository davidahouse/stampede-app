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
//        self.viewModel.publisher = publisher
    }
    
    // MARK: - Environment

    @EnvironmentObject var theme: CurrentTheme

    // MARK: - Properties

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Repositories")) {
                ForEach(viewModel.repositories, id: \.self) { item in
//                        NavigationLink(destination: RepositoryFeature(repository: item)) {
                            RepositoryCell(repository: item)
                        .accessibilityIdentifier(item.id)
                    }
            }
            Section(header: Text("Monitor")) {
                Button("Live", action: {})
                Button("Active Builds", action: {})
                Button("Active Tasks", action: {})
                Button("Queues", action: {})

//                NavigationLink(destination: MonitorLiveFeature()) {
//                    Text("Live")
//                }.accessibility(identifier: "monitor-live")
//                NavigationLink(destination: MonitorActiveBuildsFeature()) {
//                    Text("Active Builds")
//                }.accessibility(identifier: "monitor-active-builds")
//                NavigationLink(destination: MonitorActiveTasksFeature()) {
//                    Text("Active Tasks")
//                }.accessibility(identifier: "monitor-active-tasks")
//                NavigationLink(destination: MonitorQueuesFeature()) {
//                    Text("Queues")
//                }.accessibility(identifier: "monitor-queues")
            }
            Section(header: Text("History")) {
                Button("Builds", action: {})
                Button("Tasks", action: {})
//                NavigationLink(destination: HistoryBuildsFeature()) {
//                    Text("Builds")
//                }.accessibility(identifier: "history-builds")
//                NavigationLink(destination: HistoryTasksFeature()) {
//                    Text("Tasks")
//                }.accessibility(identifier: "history-tasks")
            }
            Section(header: Text("Settings")) {
                Button("Stampede Server", action: {})
                Button("Repositories", action: {})
                Button("Notifications", action: {})
                Button("Info", action: {})
//                NavigationLink(destination: SettingsStampedeServerFeature()) {
//                    Text("Stampede Server")
//                }.accessibility(identifier: "settings-stampede-server")
//                NavigationLink(destination: SettingsRepositoriesFeature()) {
//                    Text("Repositories")
//                }.accessibility(identifier: "settings-repositories")
//                NavigationLink(destination: SettingsNotificationsFeature()) {
//                    Text("Notifications")
//                }.accessibility(identifier: "settings-notifications")
//                NavigationLink(destination: SettingsInfoFeature()) {
//                    Text("Info")
//                }.accessibility(identifier: "settings-info")
            }
        }.listStyle(GroupedListStyle())
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {        
        Previewer {
            MainView(viewModel: MainViewModel(repositories: Repository.someRepositories))
        }
    }
}
#endif
