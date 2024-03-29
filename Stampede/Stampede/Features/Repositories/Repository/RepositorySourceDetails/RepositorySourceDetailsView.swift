//
//  RepositorySourceDetailsView.swift
//  Stampede
//
//  Created by David House on 10/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit
import Combine

struct RepositorySourceDetailsView: View {

    // MARK: - Observed objects

    @EnvironmentObject var viewModel: RepositorySourceDetailsViewModel

    var body: some View {
        BaseView(viewModel: viewModel, content: { builds in
            List {
                ForEach(builds, id: \.self) { item in
                    BuildDetailsCell(buildDetails: item)
                }
            }
            .listStyle(DefaultListStyle())
        })
    }
}

#if DEBUG
struct RepositorySourceDetailsView_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<RepositorySourceDetailsViewModel>] {
        [
            PreviewData(id: "someResults", viewModel: RepositorySourceDetailsViewModel(state: .results([BuildDetails.completedBuild]))),
            PreviewData(id: "loading", viewModel: RepositorySourceDetailsViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: RepositorySourceDetailsViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: RepositorySourceDetailsViewModel) -> some View {
        return RepositorySourceDetailsView().environmentObject(viewModel)
    }
}
#endif
