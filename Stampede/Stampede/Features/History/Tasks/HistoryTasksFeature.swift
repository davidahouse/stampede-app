//
//  HistoryTasksFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//
import UIKit
import SwiftUI

struct HistoryTasksRoute: Route {
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return HistoryTasksFeature(dependencies: dependencies)
    }
}

class HistoryTasksFeature: BaseFeature {
    
    // MARK: - Private Properties
    
    private var viewModel = HistoryTasksViewModel(state: .loading)

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    HistoryTasksView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task History"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.publisher = dependencies.service.fetchHistoryTasksPublisher()
    }
}
