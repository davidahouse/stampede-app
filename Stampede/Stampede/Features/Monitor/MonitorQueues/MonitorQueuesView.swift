//
//  MonitorQueuesView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import StampedeCommon

struct MonitorQueuesView: View {

    // MARK: - Environment


    // MARK: - Observed Objects

//    @ObservedObject var viewModel: BaseListViewModel<QueueSummary>

    // MARK: - View

    var body: some View {
        Text("hello")
//        StandardList(viewModel.state)
//        .navigationBarTitle("Queue Summary")
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
