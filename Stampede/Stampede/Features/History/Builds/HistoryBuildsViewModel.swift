//
//  HistoryBuildsViewModel.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI
import HouseKit

class HistoryBuildsViewModel: BaseViewModel<[BuildDetails]> {

    let X: XXX
}

#if DEBUG
extension HistoryBuildsViewModel {
    static let loading = HistoryBuildsViewModel(state: .loading)
    static let networkError = HistoryBuildsViewModel(state: .networkError(.network(description: "some error")))
    static let someBuilds = HistoryBuildsViewModel(state: .results([BuildDetails.completedBuild]))
    static let noBuilds = HistoryBuildsViewModel(state: .results([]))
}
#endif
