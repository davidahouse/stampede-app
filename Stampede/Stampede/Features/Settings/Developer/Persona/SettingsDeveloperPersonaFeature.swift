//
//  SettingsDeveloperPersonaFeature.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

class SettingsDeveloperPersonaFeature: BaseFeature {

    // MARK: - Static methods

    static func makeFeature(_ dependencies: Dependencies) -> BaseFeature {
        return SettingsDeveloperPersonaFeature(dependencies: dependencies)
    }

    // MARK: - Private Properties

    private var viewModel = SettingsDeveloperPersonaViewModel()

    // MARK: - Overrides

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SettingsDeveloperPersonaView(delegate: self)
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Persona"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.selectedPersona = dependencies.defaults.fixturePersona ?? "None"
    }
}

extension SettingsDeveloperPersonaFeature: SettingsDeveloperPersonaDelegate {

    func didSelectPersona(_ persona: String) {
        viewModel.selectedPersona = persona
        dependencies.defaults.fixturePersona = persona
        if persona == "None" {
            dependencies.selectNetworkProvider()
        } else {
            dependencies.selectFixturePersona(persona)
        }
    }
}
