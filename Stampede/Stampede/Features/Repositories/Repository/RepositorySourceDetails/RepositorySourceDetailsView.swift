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
#endif
