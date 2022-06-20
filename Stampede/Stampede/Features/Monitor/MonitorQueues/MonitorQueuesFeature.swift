//
//  MonitorQueuesFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI
import Combine

struct MonitorQueuesRoute: Route {
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return MonitorQueuesFeature(dependencies: dependencies)
    }
    
    func makeView() -> any View {
        EmptyView()
    }

}

class MonitorQueuesFeature: BaseFeature {

    // MARK: - Private Properties
    
    private var viewModel = MonitorQueuesViewModel(state: .loading)

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    MonitorQueuesView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Queue Status"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.publisher = dependencies.service.fetchMonitorQueuesPublisher()
        viewModel.startRefreshing()
    }

    override func viewWillDisappear(_ animated: Bool) {
        viewModel.stopRefreshing()
    }
}
