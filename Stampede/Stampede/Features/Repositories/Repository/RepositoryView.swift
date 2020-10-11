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

    // MARK: - Private Properties
    
    let router: Router?
    
    // MARK: - Observed objects

    @ObservedObject var viewModel: RepositoryViewModel

    // MARK: - Initializer
    
    init(viewModel: RepositoryViewModel, router: Router? = nil) {
        self.viewModel = viewModel
        self.router = router
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
                branchBuildsList()
            }

            Section(header: Text("Releases")) {
                releaseBuildsList()
            }

            Section(header: Text("Pull Requests")) {
                pullRequestBuildsList()
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
                    Button(action: {
                        router?.route(to: .buildDetails(item))
                    }, label: {
                        BuildStatusCell(buildStatus: item)
                    })
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

    @ViewBuilder private func branchBuildsList() -> some View {
        switch viewModel.branchKeysState {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Task")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let keys):
            if keys.count > 0 {
                ForEach(keys, id: \.self) { item in
                    BuildKeyCell(buildKey: item)
                }
            } else {
                Text("No branch builds found")
            }
        }
    }

    @ViewBuilder private func releaseBuildsList() -> some View {
        switch viewModel.releaseKeysState {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Task")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let keys):
            if keys.count > 0 {
                ForEach(keys, id: \.self) { item in
                    BuildKeyCell(buildKey: item)
                }
            } else {
                Text("No release builds found")
            }
        }
    }

    @ViewBuilder private func pullRequestBuildsList() -> some View {
        switch viewModel.pullRequestKeysState {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Task")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let keys):
            if keys.count > 0 {
                ForEach(keys, id: \.self) { item in
                    BuildKeyCell(buildKey: item)
                }
            } else {
                Text("No pull request builds found")
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
