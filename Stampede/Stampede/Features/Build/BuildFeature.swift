//
//  RepositoryBuildFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct BuildFeature: View {

    // MARK: - Properties

    let buildStatus: BuildStatus

    // MARK: - View

    var body: some View {
        BuildView(viewModel: BuildViewModel(buildStatus: buildStatus))
            .navigationBarTitle(buildStatus.buildIdentifier)
    }
}

#if DEBUG
struct BuildFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            BuildFeature(buildStatus: BuildStatus.someActiveBuild)
        }
    }
}
#endif
