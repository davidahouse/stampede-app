//
//  SettingsInfoFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//
import UIKit
import SwiftUI

struct SettingsInfoRoute: Route {
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return SettingsInfoFeature(dependencies: dependencies)
    }
    
    func makeView() -> any View {
        EmptyView()
    }

}

class SettingsInfoFeature: BaseFeature {
    
    // MARK: - Private Properties
    
    private var viewModel = SettingsInfoViewModel()
    
    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SettingsInfoView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stampede Info"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
    }
}
