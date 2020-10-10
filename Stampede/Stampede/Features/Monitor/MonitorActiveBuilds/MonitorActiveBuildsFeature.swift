//
//  MonitorActiveBuildsFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/3/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI

class MonitorActiveBuildsFeature: BaseFeature<Dependencies> {

    // MARK: - Private Properties
    
    private var viewModel = MonitorActiveBuildsViewModel(state: .loading)

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    MonitorActiveBuildsView(viewModel: viewModel)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Active Builds"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.publisher = dependencies.service.fetchActiveBuildsPublisher()
    }
}
