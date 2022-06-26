//
//  HistoryBuildsView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct HistoryBuildsView: View {

    // MARK: - View Model
    
    @StateObject var viewModel = HistoryBuildsViewModel()
    @EnvironmentObject var service: StampedeService

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { activeBuilds in
            List {
                if activeBuilds.count > 0 {
                    ForEach(activeBuilds, id: \.self) { item in
                        NavigationLink(value: item) {
                            BuildDetailsCell(buildDetails: item)
                        }
                    }
                } else {
                    PrimaryLabel("No builds found")
                }
            }
            .listStyle(DefaultListStyle())
        })
        .navigationTitle("Build History")
        .task {
            await viewModel.fetch(service: service)
        }
    }
}

#if DEBUG
struct HistoryBuildsView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        devicePreviews
    }

    static var defaultViewModel: PreviewData<HistoryBuildsViewModel> {
        PreviewData(id: "someBuilds", viewModel: HistoryBuildsViewModel.someBuilds)
    }

    static var alternateViewModels: [PreviewData<HistoryBuildsViewModel>] {
        [
            PreviewData(id: "noBuilds", viewModel: HistoryBuildsViewModel.noBuilds),
            PreviewData(id: "loading", viewModel: HistoryBuildsViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: HistoryBuildsViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: HistoryBuildsViewModel) -> some View {
        return HistoryBuildsView().environmentObject(viewModel)
    }
}
#endif
