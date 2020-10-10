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
    
    @ObservedObject var viewModel: HistoryBuildsViewModel

    // MARK: - Initializer
    
    init(viewModel: HistoryBuildsViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    
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
                        BuildStatusCell(buildStatus: item)
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
