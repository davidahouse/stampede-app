//
//  MonitorActiveBuildsView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/3/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveBuildsView: View {

    // MARK: - View Model
    
    @StateObject var viewModel = MonitorActiveBuildsViewModel()
    @EnvironmentObject var service: StampedeService

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { activeBuilds in
            List {
                if activeBuilds.count > 0 {
                    ForEach(activeBuilds, id: \.self) { item in
                        NavigationLink(value: item) {
                            BuildStatusCell(buildStatus: item)
                        }
                    }
                } else {
                    PrimaryLabel("No active builds found")
                }
            }
            .listStyle(DefaultListStyle())
        })
        .navigationTitle("Active Builds")
        .task {
            await viewModel.fetch(service: service)
        }
        .refreshable {
            await viewModel.fetch(service: service)
        }
    }}

#if DEBUG
struct MonitorActiveBuildsView_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<MonitorActiveBuildsViewModel>] {
        [
            PreviewData(id: "someBuilds", viewModel: MonitorActiveBuildsViewModel.someBuilds),
            PreviewData(id: "loading", viewModel: MonitorActiveBuildsViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: MonitorActiveBuildsViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: MonitorActiveBuildsViewModel) -> some View {
        return MonitorActiveBuildsView().environmentObject(viewModel)
    }
}
#endif
