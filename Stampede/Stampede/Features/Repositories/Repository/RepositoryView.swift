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

    init(viewModel: RepositoryViewModel, activeBuildsPublisher: BuildStatusResponsePublisher? = nil) {
        self.viewModel = viewModel
        self.viewModel.activeBuildsPublisher = activeBuildsPublisher
    }

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Active Builds")) {
                activeBuildsList()
            }

            Section(header: Text("Repository Builds")) {
                ForEach(viewModel.repositoryBuilds, id: \.self) { item in
                    StandardCell(viewModel: item.toStandardCellViewModel())
                }
            }

            Section(header: Text("Branches")) {
                ForEach(viewModel.branchKeys, id: \.self) { item in
                    StandardCell(viewModel: item.toStandardCellViewModel())
                }
            }

            Section(header: Text("Releases")) {
                ForEach(viewModel.releaseKeys, id: \.self) { item in
                    StandardCell(viewModel: item.toStandardCellViewModel())
                }
            }

            Section(header: Text("Pull Requests")) {
                ForEach(viewModel.pullRequestKeys, id: \.self) { item in
                    StandardCell(viewModel: item.toStandardCellViewModel())
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
            ForEach(activeBuilds, id: \.self) { item in
                NavigationLink(destination: BuildFeature(buildStatus: item)) {
                    StandardCell(viewModel: item.toStandardCellViewModel())
                }
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
