//
//  MonitorActiveTasksViewModel.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

@MainActor
class MonitorActiveTasksViewModel: BaseViewModel<[TaskStatus]> {

    public func fetch(service: StampedeService) async {
        state = await service.fetchActiveTasks()
    }
}

#if DEBUG
extension MonitorActiveTasksViewModel {
    static let loading = MonitorActiveTasksViewModel(state: .loading)
    static let networkError = MonitorActiveTasksViewModel(state: .networkError(.network(description: "some error")))
    static let someTasks = MonitorActiveTasksViewModel(state: .results(TaskStatus.recentTasks))
}
#endif
