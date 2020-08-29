//
//  MonitorLiveFeature.swift
//  Stampede
//
//  Created by David House on 6/3/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import Combine

struct MonitorLiveFeature: View {

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    @State var viewModel: MonitorLiveViewModel = MonitorLiveViewModel()

    // MARK: Initializer

    init(gauges: [MonitorLiveViewModelQueue]? = nil) {
        if let gauges = gauges {
            viewModel.queueGauges = gauges
        }
    }

    // MARK: Body

    var body: some View {
        MonitorLiveView(viewModel: viewModel)
            .navigationBarTitle("Live Status")
    }
}

#if DEBUG
struct MonitorLiveFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                MonitorLiveFeature(gauges: [
                    MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.fullQueue, history: [
                        MonitorLiveViewModel.idleQueue,
                        MonitorLiveViewModel.idleQueue,
                        MonitorLiveViewModel.partialQueue,
                        MonitorLiveViewModel.partialQueue,
                        MonitorLiveViewModel.idleQueue,
                        MonitorLiveViewModel.idleQueue,
                        MonitorLiveViewModel.idleQueue,
                        MonitorLiveViewModel.fullQueue,
                        MonitorLiveViewModel.fullQueue,
                        MonitorLiveViewModel.fullQueue
                    ])
                ])
            }
        }
    }
}
#endif
