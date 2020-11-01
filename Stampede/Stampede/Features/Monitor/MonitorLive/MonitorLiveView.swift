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

    @EnvironmentObject var viewModel: MonitorLiveViewModel

    // MARK: - View
    var body: some View {
        VStack {
            QueueGaugeView(info: viewModel.gaugeInfo)
            Spacer()
            QueueChartView(measurements: viewModel.queueDepths)
            Text("Queue Depth")
            Spacer()
        }
    }
}

#if DEBUG
struct MonitorLiveView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        MonitorLiveView_Previews.devicePreviews
    }

    static var defaultViewModel: PreviewData<MonitorLiveViewModel> {
        PreviewData(id: "someResults", viewModel: MonitorLiveViewModel.someViewModel)
    }

    static var alternateViewModels: [PreviewData<MonitorLiveViewModel>] {
        [
        ]
    }

    static func create(from viewModel: MonitorLiveViewModel) -> some View {
        return MonitorLiveView().environmentObject(viewModel)
    }
}
#endif
