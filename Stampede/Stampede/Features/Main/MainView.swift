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

protocol MainViewDelegate: class {
    // Favorite Repositories
    func didSelectRepository(_ repository: Repository)
    
    // Monitor
    func didSelectMonitorLive()
    func didSelectMonitorActiveBuilds()
    func didSelectMonitorActiveTasks()
    func didSelectMonitorQueues()
    
    // History
    func didSelectHistoryBuilds()
    func didSelectHistoryTasks()
    
    // Settings
    func didSelectSettingsStampedeServer()
    func didSelectSettingsRepositories()
    func didSelectSettingsNotifications()
    func didSelectSettingsInfo()
}

struct MainView: View {

    // MARK: - View Model
    
    @ObservedObject var viewModel: MainViewModel

    // MARK: - Environment

    @EnvironmentObject var theme: CurrentTheme
    
    // MARK: - Private properties
    
    private weak var delegate: MainViewDelegate?

    // MARK: - Initializer
    
    init(viewModel: MainViewModel, delegate: MainViewDelegate? = nil) {
        self.viewModel = viewModel
        self.delegate = delegate
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
                            self.delegate?.didSelectRepository(item)
                        }) {
                            RepositoryCell(repository: item)
                        }.accessibilityIdentifier(item.id)
                    }
                }
            }
            Section(header: Text("Monitor")) {
                Button("Live", action: {
                    delegate?.didSelectMonitorLive()
                })
                    .accessibility(identifier: "monitor-live")
                Button("Active Builds", action: {
                    delegate?.didSelectMonitorActiveBuilds()
                })
                    .accessibility(identifier: "monitor-active-builds")
                Button("Active Tasks", action: {
                    delegate?.didSelectMonitorActiveTasks()
                })
                    .accessibility(identifier: "monitor-active-tasks")
                Button("Queues", action: {
                    delegate?.didSelectMonitorQueues()
                })
                    .accessibility(identifier: "monitor-queues")
            }
            Section(header: Text("History")) {
                Button("Builds", action: {
                    delegate?.didSelectHistoryBuilds()
                })
                    .accessibility(identifier: "history-builds")
                Button("Tasks", action: {
                    delegate?.didSelectHistoryTasks()
                })
                    .accessibility(identifier: "history-tasks")
            }
            Section(header: Text("Settings")) {
                Button("Stampede Server", action: {
                    delegate?.didSelectSettingsStampedeServer()
                })
                    .accessibility(identifier: "settings-stampede-server")
                Button("Repositories", action: {
                    delegate?.didSelectSettingsRepositories()
                })
                .accessibility(identifier: "settings-repositories")
                Button("Notifications", action: {
                    delegate?.didSelectSettingsNotifications()
                }).accessibility(identifier: "settings-notifications")
                Button("Info", action: {
                    delegate?.didSelectSettingsInfo()
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
