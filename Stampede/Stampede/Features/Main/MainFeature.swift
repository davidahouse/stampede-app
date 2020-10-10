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
        
    }

    func didSelectMonitorActiveBuilds() {
        
    }

    func didSelectMonitorActiveTasks() {
        
    }

    func didSelectMonitorQueues() {
        
    }

    func didSelectHistoryBuilds() {
        
    }

    func didSelectHistoryTasks() {
        
    }

    func didSelectSettingsStampedeServer() {
        
    }

    func didSelectSettingsNotifications() {
        
    }

    func didSelectSettingsInfo() {
        
    }

    func didSelectSettingsRepositories() {
        let settingsRepositoriesFeature = SettingsRepositoriesFeature(dependencies: dependencies)
        navigationController?.pushViewController(settingsRepositoriesFeature, animated: true)
    }
}
