//
//  HistoryTasksViewModel.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

@MainActor
class HistoryTasksViewModel: BaseViewModel<[TaskStatus]> {
    public func fetch(service: StampedeService) async {
        state = await service.fetchHistoryTasks()
    }
}

#if DEBUG
extension HistoryTasksViewModel {
    static let loading = HistoryTasksViewModel(state: .loading)
    static let networkError = HistoryTasksViewModel(state: .networkError(.network(description: "some error")))
    static let someTasks = HistoryTasksViewModel(state: .results(TaskStatus.recentTasks))
}
#endif
