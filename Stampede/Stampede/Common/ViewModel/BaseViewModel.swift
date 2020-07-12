//
//  BaseViewModel.swift
//  Stampede-Mobile
//
//  Created by David House on 1/4/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine

class BaseViewModel {
    var disposables = Set<AnyCancellable>()
    var refreshTimer: Timer?
    var shouldRefresh = false

    init(shouldRefresh: Bool = false) {
        self.shouldRefresh = shouldRefresh
        refresh()
    }

    deinit {
        refreshTimer?.invalidate()
    }

    func fetch() { }

    private func refresh() {
        fetch()

        if refreshTimer == nil && shouldRefresh == true {
            refreshTimer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { [weak self] _ in
                self?.refresh()
            })
        }
    }
}
