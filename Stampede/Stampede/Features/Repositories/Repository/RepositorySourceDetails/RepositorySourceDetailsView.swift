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
    @EnvironmentObject var router: Router

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
struct RepositorySourceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            RepositorySourceDetailsView()
                .environmentObject(RepositorySourceDetailsViewModel(state: .results([BuildDetails.completedBuild])))
        }
    }
}

extension RepositorySourceDetailsView_Previews: Previewable {

    static var defaultViewModel: PreviewData<RepositorySourceDetailsViewModel> {
        PreviewData(id: "someResults", viewModel: RepositorySourceDetailsViewModel(state: .results([BuildDetails.completedBuild])))
    }

    static var alternateViewModels: [PreviewData<RepositorySourceDetailsViewModel>] {
        [
            PreviewData(id: "loading", viewModel: RepositorySourceDetailsViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: RepositorySourceDetailsViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: RepositorySourceDetailsViewModel) -> some View {
        return RepositorySourceDetailsView().environmentObject(viewModel)
    }
}
#endif
