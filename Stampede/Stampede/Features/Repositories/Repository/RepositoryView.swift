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
    
    // MARK: - Observed objects

    @StateObject var viewModel: RepositoryViewModel
    @EnvironmentObject var service: StampedeService

    // MARK: - Initializer

    init(repository: Repository) {
        _viewModel = StateObject(wrappedValue: RepositoryViewModel(repository: repository))
    }

    // MARK: - View

    var body: some View {
        List {
            Section(header: SectionHeaderLabel("Active Builds")) {
                BaseSubView(state: viewModel.activeBuildsState, content: { activeBuilds in
                    if activeBuilds.count > 0 {
                        ForEach(activeBuilds, id: \.self) { item in
                            NavigationLink(value: item) {
                                BuildStatusCell(buildStatus: item)
                            }
                        }
                    } else {
                        PrimaryLabel("No active builds found")
                    }
                })
            }

            Section(header: SectionHeaderLabel("Repository Builds")) {
                BaseSubView(state: viewModel.repositoryBuildsState, content: { builds in
                    if builds.count > 0 {
                        ForEach(builds, id: \.self) { item in
                            RepositoryBuildCell(repository: viewModel.repository, repositoryBuild: item)
                        }
                    } else {
                        PrimaryLabel("No repository builds found")
                    }
                })
            }

            Section(header: SectionHeaderLabel("Branches")) {
                BaseSubView(state: viewModel.branchKeysState, content: { keys in
                    if keys.count > 0 {
                        ForEach(keys, id: \.self) { item in
                            BuildKeyCell(repository: viewModel.repository, buildKey: item)
                        }
                    } else {
                        PrimaryLabel("No branch builds found")
                    }
                })
            }

            Section(header: SectionHeaderLabel("Releases")) {
                BaseSubView(state: viewModel.releaseKeysState, content: { keys in
                    if keys.count > 0 {
                        ForEach(keys, id: \.self) { item in
                            BuildKeyCell(repository: viewModel.repository, buildKey: item)
                        }
                    } else {
                        PrimaryLabel("No release builds found")
                    }
                })
            }

            Section(header: SectionHeaderLabel("Pull Requests")) {
                BaseSubView(state: viewModel.pullRequestKeysState, content: { keys in
                    if keys.count > 0 {
                        ForEach(keys, id: \.self) { item in
                            BuildKeyCell(repository: viewModel.repository, buildKey: item)
                        }
                    } else {
                        PrimaryLabel("No pull request builds found")
                    }
                })
            }
        }
        .listStyle(DefaultListStyle())
        .navigationTitle(viewModel.repository.repository)
        .refreshable {
            await viewModel.fetch(service: service)
        }
        .task {
            await viewModel.fetch(service: service)
        }
    }
}

#if DEBUG
struct RepositoryView_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<RepositoryViewModel>] {
        [
            PreviewData(id: "someResults", viewModel: RepositoryViewModel.someViewModel)
        ]
    }

    static func create(from viewModel: RepositoryViewModel) -> some View {
        return RepositoryView(repository: viewModel.repository)
    }
}
#endif
