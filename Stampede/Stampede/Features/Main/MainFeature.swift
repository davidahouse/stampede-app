//
//  MainFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/1/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI
import Combine
import HouseKit

class MainFeature: BaseFeature<Dependencies> {

    // MARK: - Private Properties
    
    private var viewModel = MainViewModel(state: .loading)

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    MainView(viewModel: viewModel, delegate: self)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stampede"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.publisher = dependencies.repositoryList.fetchRepositoriesPublisher()
    }
}

extension MainFeature: MainViewDelegate {
    
    func didSelectRepository(_ repository: Repository) {
        
    }

    func didSelectMonitorLive() {
        let monitorLiveFeature = MonitorLiveFeature(dependencies: dependencies)
        navigationController?.pushViewController(monitorLiveFeature, animated: true)
    }

    func didSelectMonitorActiveBuilds() {
        let monitorActiveBuilds = MonitorActiveBuildsFeature(dependencies: dependencies)
        navigationController?.pushViewController(monitorActiveBuilds, animated: true)
    }

    func didSelectMonitorActiveTasks() {
        let monitorActiveTasks = MonitorActiveTasksFeature(dependencies: dependencies)
        navigationController?.pushViewController(monitorActiveTasks, animated: true)
    }

    func didSelectMonitorQueues() {
        let monitorQueues = MonitorQueuesFeature(dependencies: dependencies)
        navigationController?.pushViewController(monitorQueues, animated: true)
    }

    func didSelectHistoryBuilds() {
        let historyBuilds = HistoryBuildsFeature(dependencies: dependencies)
        navigationController?.pushViewController(historyBuilds, animated: true)
    }

    func didSelectHistoryTasks() {
        let historyTasks = HistoryTasksFeature(dependencies: dependencies)
        navigationController?.pushViewController(historyTasks, animated: true)
    }

    func didSelectSettingsStampedeServer() {
        let stampedeServer = SettingsStampedeServerFeature(dependencies: dependencies)
        navigationController?.pushViewController(stampedeServer, animated: true)
    }

    func didSelectSettingsNotifications() {
        let notifications = SettingsNotificationsFeature(dependencies: dependencies)
        navigationController?.pushViewController(notifications, animated: true)
    }

    func didSelectSettingsInfo() {
        let info = SettingsInfoFeature(dependencies: dependencies)
        navigationController?.pushViewController(info, animated: true)
    }

    func didSelectSettingsRepositories() {
        let settingsRepositoriesFeature = SettingsRepositoriesFeature(dependencies: dependencies)
        navigationController?.pushViewController(settingsRepositoriesFeature, animated: true)
    }
}
