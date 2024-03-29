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

    var body: some View {
        List {
            Section(header: SectionHeaderLabel("Active Builds")) {
                BaseSubView(state: viewModel.activeBuildsState, content: { activeBuilds in
                    if activeBuilds.count > 0 {
                        ForEach(activeBuilds, id: \.self) { item in
                            BuildStatusCell(buildStatus: item)
                        }
                    } else {
                        PrimaryLabel("No active builds found")
                    }
                })
            }

            Section(header: SectionHeaderLabel("Recent Builds")) {
                BaseSubView(state: viewModel.recentBuildsState, content: { recentBuilds in
                    if recentBuilds.count > 0 {
                        ForEach(recentBuilds, id: \.self) { item in
                            BuildDetailsCell(buildDetails: item)
                        }
                    } else {
                        PrimaryLabel("No recent builds found")
                    }
                })
            }
        }
    }
}

#if DEBUG
struct RepositoryBuildDetailsView_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<RepositoryBuildDetailsViewModel>] {
        [
            PreviewData(id: "someResults", viewModel: RepositoryBuildDetailsViewModel(repository: Repository.someRepository, build: "123", activeBuildsState: .results(BuildStatus.activeBuilds), recentBuildsState: .results([BuildDetails.completedBuild])))
        ]
    }

    static func create(from viewModel: RepositoryBuildDetailsViewModel) -> some View {
        return RepositoryBuildDetailsView().environmentObject(viewModel)
    }
}
#endif
