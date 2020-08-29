//
//  MonitorActiveBuildsViewModel.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class MonitorActiveBuildsViewModel: BaseViewModel<[BuildStatus]> { }

#if DEBUG
extension MonitorActiveBuildsViewModel {
    static let loading = MonitorActiveBuildsViewModel(state: .loading)
    static let networkError = MonitorActiveBuildsViewModel(state: .networkError)
    static let someBuilds = MonitorActiveBuildsViewModel(state: .results(BuildStatus.recentBuilds))
}
#endif