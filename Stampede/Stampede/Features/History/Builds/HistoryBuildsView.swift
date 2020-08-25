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
    
    let activeBuilds: [BuildStatus] = []
    
    var body: some View {
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

#if DEBUG
struct HistoryBuildsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            HistoryBuildsView(viewModel: HistoryBuildsViewModel(builds: BuildStatus.activeBuilds))
        }
    }
}
#endif
