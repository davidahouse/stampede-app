//
//  View+Extension.swift
//  Stampede
//
//  Created by David House on 12/21/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import SwiftUI

extension View {

    func dependenciesToEnvironment(_ dependencies: Dependencies) -> some View {
        return self
            .environmentObject(dependencies.theme)
            .environmentObject(dependencies.service)
    }

    #if DEBUG
    func previewDependencies() -> some View {
        return self
            .environmentObject(StampedeDefaults.someDefaults)
            .environmentObject(CurrentTheme())
            .environmentObject(RepositoryListFixture())
            .environmentObject(StampedeService(provider: StampedeServiceFixtureProvider()))
    }
    #endif
}
