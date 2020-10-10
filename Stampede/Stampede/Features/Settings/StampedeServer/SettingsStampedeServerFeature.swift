//
//  StampedeServerFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//
import UIKit
import SwiftUI

class SettingsStampedeServerFeature: BaseFeature<Dependencies> {

    // MARK: - Private Properties
    
    private var viewModel = SettingsStampedeServerViewModel()
    
    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SettingsStampedeServerView(viewModel: viewModel)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stampede Server"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.stampedeServerURL = dependencies.defaults.host ?? ""
        viewModel.subject = dependencies.service.hostPassthroughSubject
    }
}
