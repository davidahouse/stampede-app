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

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

//    let viewModel: BaseListViewModel<QueueSummary>

    // MARK: Initializer

//    init(state: StandardListState<QueueSummary>? = nil) {
//        if let state = state {
//            viewModel = BaseListViewModel<QueueSummary>(state: state)
//        } else {
//            viewModel = BaseListViewModel<QueueSummary>()
//        }
//        viewModel.shouldRefresh = true
//    }

    // MARK: - View

    var body: some View {
        MonitorQueuesView()
        //        MonitorQueuesView(viewModel: viewModel)
//        .onAppear {
//            // give the view model a new publisher?
//            self.viewModel.publisher = self.service.fetchMonitorQueuesPublisher()
//        }
//        .onDisappear {
//            // invalidate the publisher as we don't want
//            // the view to refresh while not visible?
//            self.viewModel.publisher = nil
//        }
    }
}

#if DEBUG
struct MonitorQueuesFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            MonitorQueuesFeature()
        }
    }
}
#endif
