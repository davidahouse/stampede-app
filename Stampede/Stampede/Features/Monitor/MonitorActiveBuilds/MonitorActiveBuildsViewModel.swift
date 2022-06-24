//
//  MonitorActiveBuildsViewModel.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class MonitorActiveBuildsViewModel: BaseViewModel<[BuildStatus]> {

    public func fetch(service: StampedeService) async {
        state = await service.fetchActiveBuilds()
    }
}

#if DEBUG
extension MonitorActiveBuildsViewModel {
    static let loading = MonitorActiveBuildsViewModel(state: .loading)
    static let networkError = MonitorActiveBuildsViewModel(state: .networkError(.network(description: "some error")))
    static let someBuilds = MonitorActiveBuildsViewModel(state: .results(BuildStatus.activeBuilds))
}
#endif
