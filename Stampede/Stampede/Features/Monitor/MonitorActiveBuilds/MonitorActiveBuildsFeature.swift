//
//  MonitorActiveBuildsFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/3/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveBuildsFeature: View {

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

//    let viewModel: BaseListViewModel<BuildStatus>

    // MARK: Initializer

//    init(state: StandardListState<BuildStatus>? = nil) {
//        if let state = state {
//            viewModel = BaseListViewModel<BuildStatus>(state: state)
//        } else {
//            viewModel = BaseListViewModel<BuildStatus>()
//        }
//        viewModel.shouldRefresh = true
//    }
    // MARK: - View

    var body: some View {
        MonitorActiveBuildsView()
//        MonitorActiveBuildsView(viewModel: viewModel)
//        .onAppear {
//            // give the view model a new publisher?
//            self.viewModel.publisher = self.service.fetchActiveBuildsPublisher()
//        }
//        .onDisappear {
//            // invalidate the publisher as we don't want
//            // the view to refresh while not visible?
//            self.viewModel.publisher = nil
//        }
    }
}

#if DEBUG
struct MonitorActiveBuildsFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            MonitorActiveBuildsFeature()
        }
    }
}
#endif
