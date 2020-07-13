//
//  MonitorQueuesView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorQueuesView: View {

    // MARK: - Environment

    // MARK: - Observed Objects

//    @ObservedObject var viewModel: BaseListViewModel<QueueSummary>

    // MARK: - View

    let queues = QueueSummary.someSummaries

    var body: some View {
        List {
            ForEach(queues, id: \.self) { item in
                StandardCell(viewModel: item.toStandardCellViewModel())
            }
        }
    }
}

#if DEBUG
struct MonitorQueuesView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorQueuesView()
        }
    }
}
#endif
