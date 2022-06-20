//
//  SettingsNotificationFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//
import UIKit
import SwiftUI

struct SettingsNotificationsRoute: Route {
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return SettingsNotificationsFeature(dependencies: dependencies)
    }
    
    func makeView() -> any View {
        EmptyView()
    }

}

class SettingsNotificationsFeature: BaseFeature {
    
    // MARK: - Private Properties
    
    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SettingsNotificationsView()
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notifications"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
    }
}
