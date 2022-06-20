//
//  MonitorActiveTasksFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI
import Combine

struct MonitorActiveTasksRoute: Route {
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return MonitorActiveTasksFeature(dependencies: dependencies)
    }
    
    func makeView() -> any View {
        EmptyView()
    }

}

class MonitorActiveTasksFeature: BaseFeature {

    // MARK: - Static methods
    
    static func makeFeature(_ dependencies: Dependencies) -> BaseFeature {
        return MonitorActiveTasksFeature(dependencies: dependencies)
    }
    
    // MARK: - Private Properties
    
    private var viewModel = MonitorActiveTasksViewModel(state: .loading)

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    MonitorActiveTasksView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .environmentObject(routes)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Active Tasks"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.publisher = dependencies.service.fetchActiveTasksPublisher()
        viewModel.startRefreshing()
    }

    override func viewWillDisappear(_ animated: Bool) {
        viewModel.stopRefreshing()
    }
}
