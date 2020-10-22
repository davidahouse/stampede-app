//
//  DeveloperFeature.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

class SettingsDeveloperFeature: BaseFeature {

    // MARK: - Static methods

    static func makeFeature(_ dependencies: Dependencies) -> BaseFeature {
        return SettingsDeveloperFeature(dependencies: dependencies)
    }

    // MARK: - Private Properties

    private var viewModel = DeveloperViewModel()

    // MARK: - Overrides

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    DeveloperView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Developer"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
    }
}
