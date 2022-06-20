//
//  DeveloperFeature.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsDeveloperRoute: Route {
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return SettingsDeveloperFeature(dependencies: dependencies)
    }
    
    func makeView() -> any View {
        EmptyView()
    }

}

class SettingsDeveloperFeature: BaseFeature {

    // MARK: - Private Properties

    private var viewModel = SettingsDeveloperViewModel()

    // MARK: - Overrides

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SettingsDeveloperView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .environmentObject(routes)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Developer"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.fixturePersona = dependencies.defaults.fixturePersona ?? "None"
    }
}
