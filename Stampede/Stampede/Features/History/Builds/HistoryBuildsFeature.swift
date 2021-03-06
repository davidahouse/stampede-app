//
//  HistoryBuildsFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//
import UIKit
import SwiftUI

struct HistoryBuildsRoute: Route {
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return HistoryBuildsFeature(dependencies: dependencies)
    }
}

class HistoryBuildsFeature: BaseFeature {
        
    // MARK: - Private Properties
    
    private var viewModel = HistoryBuildsViewModel(state: .loading)

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    HistoryBuildsView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .environmentObject(routes)
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
