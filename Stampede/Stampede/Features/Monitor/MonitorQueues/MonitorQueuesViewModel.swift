//
//  MonitorQueuesViewModel.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class MonitorQueuesViewModel: BaseViewModel<[QueueSummary]> { }

#if DEBUG
extension MonitorQueuesViewModel {
    static let loading = MonitorQueuesViewModel(state: .loading)
    static let networkError = MonitorQueuesViewModel(state: .networkError)
    static let someQueues = MonitorQueuesViewModel(state: .results(QueueSummary.someSummaries))
}
#endif
