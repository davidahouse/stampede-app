//
//  HistoryBuildsFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//
import UIKit
import SwiftUI

class HistoryBuildsFeature: BaseFeature {
    
    // MARK: - Static methods
    
    static func makeFeature(_ dependencies: Dependencies) -> BaseFeature {
        return HistoryBuildsFeature(dependencies: dependencies)
    }

    // MARK: - Private Properties
    
    private var viewModel = HistoryBuildsViewModel(state: .loading)

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    HistoryBuildsView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Build History"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.publisher = dependencies.service.fetchHistoryBuildsPublisher()
    }
}
