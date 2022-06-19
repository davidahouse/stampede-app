//
//  XBaseViewModel.swift
//  Stampede
//
//  Created by David House on 6/18/22.
//  Copyright © 2022 David House. All rights reserved.
//

import Foundation
import HouseKit

// MARK: - ViewModelState

public enum XViewModelState<T> {
    case loading
    case networkError(ServiceError)
    case results(T)
}

// MARK: DataProvider
public protocol DataProvider {
    associatedtype Model
    func fetch() async -> Result<Model, ServiceError>
}


// MARK: - BaseViewModel

@available(iOS 13.0, tvOS 13.0, *)
@MainActor
open class XBaseViewModel<T>: ObservableObject {

    // MARK: - Public properties

    @Published public var state: XViewModelState<T> = .loading {
        didSet {
            self.didChangeState()
        }
    }

    public var provider: any DataProvider? = nil {
        didSet {
            self.fetch()
        }
    }

    // MARK: - Initializer

    public init(state: ViewModelState<T> = .loading, dataProvider: any DataProvider? = nil) {
        self.state = state
        self.provider = provider
        fetch()
    }

    // MARK: - Private properties

    private var refreshTimer: Timer?

    // MARK: - Public methods

    open func didChangeState() { }

    public func fetch() async {
        guard let provider = provider else {
            return
        }

        let result = await provider.fetch()
        switch result {
        case .failure(error):
            self.state = .networkError(error)
            print("got an error")
        case .success(data):
            self.state = .results(data)
        }
    }

    public func startRefreshing(interval: Int = 30) {
        refreshTimer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { [weak self] _ in
            // TODO: Fix this
//            Task {
//                self?.fetch()
//            }
        })
    }

    public func stopRefreshing() {
        refreshTimer?.invalidate()
    }
}
