//
//  RepositoryView.swift
//  Stampede-Mobile
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import HouseKit
import Combine

struct RepositoryView: View {

    // MARK: - Environment

    // MARK: - Properties

    // MARK: - Observed objects

    @ObservedObject var viewModel: RepositoryViewModel

    init(viewModel: RepositoryViewModel, activeBuildsPublisher: BuildStatusResponsePublisher? = nil, repositoryBuildsPublisher: RepositoryBuildResponsePublisher? = nil) {
        self.viewModel = viewModel
        self.viewModel.activeBuildsPublisher = activeBuildsPublisher
        self.viewModel.repositoryBuildsPublisher = repositoryBuildsPublisher
    }

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Active Builds")) {
                activeBuildsList()
            }

            Section(header: Text("Repository Builds")) {
                repositoryBuildsList()
            }

            Section(header: Text("Branches")) {
                ForEach(viewModel.branchKeys, id: \.self) { item in
                    Text("build key cell")
                    //StandardCell(viewModel: item.toStandardCellViewModel())
                }
            }

            Section(header: Text("Releases")) {
                ForEach(viewModel.releaseKeys, id: \.self) { item in
                    Text("build key cell")
//                    StandardCell(viewModel: item.toStandardCellViewModel())
                }
            }

            Section(header: Text("Pull Requests")) {
                ForEach(viewModel.pullRequestKeys, id: \.self) { item in
                    Text("build key cell")
//                    StandardCell(viewModel: item.toStandardCellViewModel())
                }
            }
        }
        .listStyle(DefaultListStyle())
    }

    @ViewBuilder private func activeBuildsList() -> some View {
        switch viewModel.activeBuildsState {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        Image(systemName: "folder.circle")
                            .frame(width: 100)
                        VStack(alignment: .leading) {
                            Text("Task")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let activeBuilds):
            if activeBuilds.count > 0 {
                ForEach(activeBuilds, id: \.self) { item in
                    NavigationLink(destination: BuildFeature(buildStatus: item)) {
                        BuildStatusCell(buildStatus: item)
                    }
                }
            } else {
                Text("No active builds found")
            }
        }
    }
    
    @ViewBuilder private func repositoryBuildsList() -> some View {
        switch viewModel.repositoryBuildsState {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        Image(systemName: "folder.circle")
                            .frame(width: 100)
                        VStack(alignment: .leading) {
                            Text("Task")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let builds):
            if builds.count > 0 {
                ForEach(builds, id: \.self) { item in
                    RepositoryBuildCell(repositoryBuild: item)
                }
            } else {
                Text("No repository builds found")
            }
        }
    }
}

#if DEBUG
struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            RepositoryView(viewModel:
                        RepositoryViewModel.someViewModel)
        }
    }
}
#endif
