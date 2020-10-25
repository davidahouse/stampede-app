//
//  MonitorLiveFeature.swift
//  Stampede
//
//  Created by David House on 6/3/20.
//  Copyright © 2020 David House. All rights reserved.
//
import UIKit
import SwiftUI
import Combine

struct MonitorLiveRoute: Route {
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return MonitorLiveFeature(dependencies: dependencies)
    }
}

class MonitorLiveFeature: BaseFeature {

    // MARK: - Private Properties
    
    private var viewModel = MonitorLiveViewModel()

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    MonitorLiveView()
                                    .environmentObject(viewModel)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Live Status"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.workersPublisher = dependencies.service.fetchWorkerStatusPublisher()
        viewModel.queuesPublisher = dependencies.service.fetchMonitorQueuesPublisher()
        viewModel.startMonitoring()
        UIApplication.shared.isIdleTimerDisabled = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        viewModel.stopMonitoring()
        UIApplication.shared.isIdleTimerDisabled = false
    }
}
