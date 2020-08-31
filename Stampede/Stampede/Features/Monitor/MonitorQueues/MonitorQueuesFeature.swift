//
//  MonitorQueuesFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import Combine

struct MonitorQueuesFeature: View {

    @EnvironmentObject var service: StampedeService

    let viewModel: MonitorQueuesViewModel

    init(viewModel: MonitorQueuesViewModel? = nil) {
        self.viewModel = viewModel ?? MonitorQueuesViewModel()
    }

    // MARK: - View

    var body: some View {
        MonitorQueuesView(viewModel: viewModel, publisher: service.fetchMonitorQueuesPublisher())
            .navigationBarTitle("Queues")
    }
}

#if DEBUG
struct MonitorQueuesFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                MonitorQueuesFeature()
            }
        }
    }
}
#endif
