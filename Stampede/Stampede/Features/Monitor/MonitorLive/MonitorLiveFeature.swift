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

class MonitorLiveFeature: BaseFeature<Dependencies> {

    // MARK: - Private Properties
    
    private var viewModel = MonitorLiveViewModel(state: .loading)

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    MonitorLiveView(viewModel: viewModel)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Live Status"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
}
