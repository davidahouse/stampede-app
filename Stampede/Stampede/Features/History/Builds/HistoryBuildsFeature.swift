//
//  HistoryBuildsFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct HistoryBuildsFeature: View {
    
    @EnvironmentObject var service: StampedeService
    
    let viewModel: HistoryBuildsViewModel

    init(viewModel: HistoryBuildsViewModel? = nil) {
        self.viewModel = viewModel ?? HistoryBuildsViewModel()
    }
    
    var body: some View {
        HistoryBuildsView(viewModel: viewModel)
            .navigationBarTitle("Build History")
    }
}

#if DEBUG
struct HistoryBuildsFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                HistoryBuildsFeature()
            }
        }
    }
}
#endif
