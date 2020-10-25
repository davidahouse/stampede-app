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
    
    @EnvironmentObject var viewModel: HistoryBuildsViewModel
    @EnvironmentObject var router: Router

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { activeBuilds in
            List {
                if activeBuilds.count > 0 {
                    ForEach(activeBuilds, id: \.self) { item in
                        BuildDetailsCell(buildDetails: item)
                    }
                } else {
                    Text("No builds found")
                }
            }
            .listStyle(DefaultListStyle())
        })
    }
}

#if DEBUG
struct HistoryBuildsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            HistoryBuildsView().environmentObject(HistoryBuildsViewModel.loading)
            HistoryBuildsView().environmentObject(HistoryBuildsViewModel.networkError)
            HistoryBuildsView().environmentObject(HistoryBuildsViewModel.someBuilds)
            HistoryBuildsView().environmentObject(HistoryBuildsViewModel.noBuilds)
        }
    }
}
#endif
