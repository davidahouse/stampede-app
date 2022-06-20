//
//  StampedeApp.swift
//  Stampede
//
//  Created by David House on 6/17/22.
//  Copyright © 2022 David House. All rights reserved.
//

import SwiftUI

@main
struct StampedeApp: App {

    @State var dependencies = {
        if let stampedeServer = ProcessInfo.processInfo.environment["StampedeServer"], stampedeServer == "fixtures" {
            return Dependencies(repositoryList: RepositoryListFixture())
        } else {
            return Dependencies()
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
                .dependenciesToEnvironment(dependencies)
        }
    }
}
