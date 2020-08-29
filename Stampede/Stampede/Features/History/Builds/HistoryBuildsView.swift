//
//  HistoryBuildsView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct HistoryBuildsView: View {
    
    @ObservedObject var viewModel: HistoryBuildsViewModel

    init(viewModel: HistoryBuildsViewModel, publisher: BuildStatusResponsePublisher? = nil) {
        self.viewModel = viewModel
        self.viewModel.publisher = publisher
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Basic list loading text")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let activeBuilds):
            List {
                ForEach(activeBuilds, id: \.self) { item in
                    NavigationLink(destination: BuildFeature(buildStatus: item)) {
                        StandardCell(viewModel: item.toStandardCellViewModel())
                    }
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
}

#if DEBUG
struct HistoryBuildsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            HistoryBuildsView(viewModel: HistoryBuildsViewModel.loading)
            HistoryBuildsView(viewModel: HistoryBuildsViewModel.networkError)
            HistoryBuildsView(viewModel: HistoryBuildsViewModel.someBuilds)
        }
    }
}
#endif
