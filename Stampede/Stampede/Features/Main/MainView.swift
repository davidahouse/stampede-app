//
//  MainView.swift
//  Stampede-Mobile
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//
import SwiftUI
import StampedeCommon

struct MainView: View {

    // MARK: - Environment

    @EnvironmentObject var theme: CurrentTheme

    // MARK: - Properties

    // MARK: - View

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Repositories")) {
                    NavigationLink(destination: RepositoryFeature(repository: Repository.someRepository)) {
                        Text("stampede-server")
                    }
                    NavigationLink(destination: RepositoryFeature(repository: Repository.someRepository)) {
                        Text("stampede-worker")
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
                Section(header: Text("Admin")) {
                    NavigationLink(destination: AdminLoginFeature()) {
                        Text("Login")
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
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Stampede")
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {        
        Previewer {
            MainView()
        }
    }
}
#endif
