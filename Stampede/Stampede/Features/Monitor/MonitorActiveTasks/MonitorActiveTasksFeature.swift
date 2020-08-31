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
    
    let viewModel: MonitorActiveTasksViewModel

    init(viewModel: MonitorActiveTasksViewModel? = nil) {
        self.viewModel = viewModel ?? MonitorActiveTasksViewModel()
    }

    // MARK: - View

    var body: some View {
        MonitorActiveTasksView(viewModel: viewModel, publisher: service.fetchActiveTasksPublisher())
            .navigationBarTitle("Active Tasks")
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
