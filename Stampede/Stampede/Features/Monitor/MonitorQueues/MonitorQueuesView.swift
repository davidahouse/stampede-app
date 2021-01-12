//
//  MonitorQueuesView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorQueuesView: View {

    // MARK: - View Model
    
    @EnvironmentObject var viewModel: MonitorQueuesViewModel

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { queues in
            List {
                Section(header: SectionHeaderLabel("Task Queues")) {
                    if queues.taskQueues.count > 0 {
                        ForEach(queues.taskQueues, id: \.self) { item in
                            QueueSummaryCell(queueSummary: item)
                        }
                    } else {
                        PrimaryLabel("No queues found")
                    }
                }
                Section(header: SectionHeaderLabel("System Queues")) {
                        if queues.systemQueues.count > 0 {
                            ForEach(queues.systemQueues, id: \.self) { item in
                                QueueSummaryCell(queueSummary: item)
                            }
                        } else {
                            PrimaryLabel("No queues found")
                        }
                }
            }
        })
    }
}

#if DEBUG
struct MonitorQueuesView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        devicePreviews
    }

    static var defaultViewModel: PreviewData<MonitorQueuesViewModel> {
        PreviewData(id: "someQueues", viewModel: MonitorQueuesViewModel.someQueues)
    }

    static var alternateViewModels: [PreviewData<MonitorQueuesViewModel>] {
        [
            PreviewData(id: "loading", viewModel: MonitorQueuesViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: MonitorQueuesViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: MonitorQueuesViewModel) -> some View {
        return MonitorQueuesView().environmentObject(viewModel)
    }
}
#endif
