//
//  MonitorLiveView.swift
//  Stampede
//
//  Created by David House on 6/3/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct MonitorLiveView: View {

    // MARK: - Environment

    // MARK: - Observed Objects

    @ObservedObject var viewModel: MonitorLiveViewModel
    
    init(viewModel: MonitorLiveViewModel) {
        self.viewModel = viewModel
    }
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 300))
    ]

    // MARK: - View
    var body: some View {
        List {
            ForEach(viewModel.queueGauges, id: \.self) { gauge in
                QueueChartView(measurements: gauge.history).aspectRatio(contentMode: .fit)
            }
        }
    }
}

#if DEBUG
struct MonitorLiveView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MonitorLiveView(viewModel: MonitorLiveViewModel.oneIdleQueue).previewDependencies()
            MonitorLiveView(viewModel: MonitorLiveViewModel.onePartialQueue).previewDependencies()
            MonitorLiveView(viewModel: MonitorLiveViewModel.oneFullQueue).previewDependencies()
            MonitorLiveView(viewModel: MonitorLiveViewModel.oneQueuedQueue).previewDependencies()
            MonitorLiveView(viewModel: MonitorLiveViewModel.twoQueues).previewDependencies()
            MonitorLiveView(viewModel: MonitorLiveViewModel.allQueues).previewDependencies()
        }
    }
}
#endif
