//
//  MonitorActiveBuildsFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/3/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveBuildsFeature: View {

    @EnvironmentObject var service: StampedeService
    
    let viewModel: MonitorActiveBuildsViewModel

    init(viewModel: MonitorActiveBuildsViewModel? = nil) {
        self.viewModel = viewModel ?? MonitorActiveBuildsViewModel()
    }
    
    var body: some View {
        MonitorActiveBuildsView(viewModel: viewModel, publisher: service.fetchActiveBuildsPublisher())
            .navigationBarTitle("Active Builds")
    }
}

#if DEBUG
struct MonitorActiveBuildsFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                MonitorActiveBuildsFeature()
            }
        }
    }
}
#endif
