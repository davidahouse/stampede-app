//
//  MonitorActiveTasksViewModel.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class MonitorActiveTasksViewModel: BaseViewModel<[TaskStatus]> { }

#if DEBUG
extension MonitorActiveTasksViewModel {
    static let loading = MonitorActiveTasksViewModel(state: .loading)
    static let networkError = MonitorActiveTasksViewModel(state: .networkError)
    static let someTasks = MonitorActiveTasksViewModel(state: .results(TaskStatus.recentTasks))
}
#endif
