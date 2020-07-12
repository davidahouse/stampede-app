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

    let viewModel = MonitorLiveViewModel()

    // MARK: Body

    var body: some View {
        MonitorLiveView(viewModel: viewModel)
        .onAppear {
            self.viewModel.queuesPublisher = self.service.fetchMonitorQueuesPublisher()
            self.viewModel.workersPublisher = self.service.fetchWorkerStatusPublisher()
            UIApplication.shared.isIdleTimerDisabled = true
        }
        .onDisappear {
            self.viewModel.queuesPublisher = nil
            self.viewModel.workersPublisher = nil
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}

#if DEBUG
struct MonitorLiveFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            MonitorLiveFeature()
        }
    }
}
#endif
