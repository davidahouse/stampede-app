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
        switch viewModel.state {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        Image(systemName: "folder.circle")
                            .frame(width: 100)
                        VStack(alignment: .leading) {
                            Text("Task")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let queues):
            List {
                if queues.count > 0 {
                    ForEach(queues, id: \.self) { item in
                        QueueSummaryCell(queueSummary: item)
                    }
                } else {
                    Text("No queues found")
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
}

#if DEBUG
struct MonitorQueuesView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorQueuesView().environmentObject(MonitorQueuesViewModel.loading)
            MonitorQueuesView().environmentObject(MonitorQueuesViewModel.networkError)
            MonitorQueuesView().environmentObject(MonitorQueuesViewModel.someQueues)
        }
    }
}
#endif
