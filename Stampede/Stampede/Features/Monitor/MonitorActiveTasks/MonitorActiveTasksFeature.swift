//
//  MonitorActiveTasksFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import Combine

struct MonitorActiveTasksFeature: View {

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

//    let viewModel: BaseListViewModel<TaskStatus>

    // MARK: Initializer

//    init(state: StandardListState<TaskStatus>? = nil) {
//        if let state = state {
//            viewModel = BaseListViewModel<TaskStatus>(state: state)
//        } else {
//            viewModel = BaseListViewModel<TaskStatus>()
//        }
//        viewModel.shouldRefresh = true
//    }

    // MARK: - View

    var body: some View {
        MonitorActiveTasksView()
            .navigationBarTitle("Active Tasks")
        //        MonitorActiveTasksView(viewModel: viewModel)
//        .onAppear {
//            // give the view model a new publisher?
//            self.viewModel.publisher = self.service.fetchActiveTasksPublisher()
//        }
//        .onDisappear {
//            // invalidate the publisher as we don't want
//            // the view to refresh while not visible?
//            self.viewModel.publisher = nil
//        }
    }
}

#if DEBUG
struct MonitorActiveTasksFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                MonitorActiveTasksFeature()
            }
        }
    }
}
#endif
