//
//  RepositoryView.swift
//  Stampede-Mobile
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct RepositoryView: View {

    // MARK: - Environment

    // MARK: - Properties

    // MARK: - Observed objects

    @ObservedObject var viewModel: RepositoryViewModel

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Active Builds")) {
                ForEach(viewModel.activeBuilds, id: \.self) { item in
                    NavigationLink(destination: BuildFeature(buildStatus: item)) {
                        StandardCell(viewModel: item.toStandardCellViewModel())
                    }
                }
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
