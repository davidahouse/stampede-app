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

    @State var dependencies = Dependencies()

    var body: some Scene {
        WindowGroup {
            if !areTestsRunning() && !arePreviewsRunning() {
                MainView()
                    .dependenciesToEnvironment(dependencies)
            } else {
                EmptyView()
            }
        }
    }
    
    private func areTestsRunning() -> Bool {
        return NSClassFromString("XCTest") != nil
    }

    private func arePreviewsRunning() -> Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil
    }
}
