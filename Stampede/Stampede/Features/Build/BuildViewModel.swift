//
//  RepositoryBuildViewModel.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import SwiftUI

class BuildViewModel: ObservableObject {

    // MARK: - Published

    @Published var buildStatus: BuildStatus
    
    var statusImage: some View {
        switch buildStatus.statusIndicator {
        case .inProgress:
            return CurrentTheme.Icons.inProgress.image()
        case .failure:
            return CurrentTheme.Icons.failure.image()
        case .success:
            return CurrentTheme.Icons.success.image()
        }
    }

    // MARK: - Initializer

    init(buildStatus: BuildStatus) {
        self.buildStatus = buildStatus
    }
}
