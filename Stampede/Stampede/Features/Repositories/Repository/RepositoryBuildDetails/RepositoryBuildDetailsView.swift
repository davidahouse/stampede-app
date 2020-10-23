//
//  RepositoryBuildDetailsView.swift
//  Stampede
//
//  Created by David House on 10/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit
import Combine

struct RepositoryBuildDetailsView: View {

    // MARK: - Observed objects

    @EnvironmentObject var viewModel: RepositoryBuildDetailsViewModel
    @EnvironmentObject var router: Router

    var body: some View {
        List {
            Section(header: Text("Active Builds")) {
                BaseSubView(state: viewModel.activeBuildsState, content: { activeBuilds in
                    if activeBuilds.count > 0 {
                        ForEach(activeBuilds, id: \.self) { item in
                            BuildStatusCell(buildStatus: item)
                        }
                    } else {
                        Text("No active builds found")
                    }
                })
            }

            Section(header: Text("Recent Builds")) {
                BaseSubView(state: viewModel.recentBuildsState, content: { recentBuilds in
                    if recentBuilds.count > 0 {
                        ForEach(recentBuilds, id: \.self) { item in
                            BuildDetailsCell(buildDetails: item)
                        }
                    } else {
                        Text("No recent builds found")
                    }
                })
            }
        }
    }
}

#if DEBUG
struct RepositoryBuildDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            RepositoryBuildDetailsView()
                .environmentObject(RepositoryBuildDetailsViewModel.someViewModel)
        }
    }
}
#endif
