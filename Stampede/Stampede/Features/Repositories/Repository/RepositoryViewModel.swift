//
//  RepositoryViewModel.swift
//  Stampede
//
//  Created by David House on 5/25/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

enum FetchState {
    case loading
    case noResults
    case error
    case hasResults
}

class RepositoryViewModel: ObservableObject {

    // MARK: - Published properties

    @Published public var activeBuildsState: ViewModelState<[BuildStatus]> = .loading
    @Published public var repositoryBuildsState: ViewModelState<[RepositoryBuild]> = .loading

    @Published public var branchKeysState: ViewModelState<[BuildKey]> = .loading
    @Published public var releaseKeysState: ViewModelState<[BuildKey]> = .loading
    @Published public var pullRequestKeysState: ViewModelState<[BuildKey]> = .loading
    
    // MARK: - Properties

    private var disposables = Set<AnyCancellable>()

    var activeBuildsPublisher: BuildStatusResponsePublisher? {
        didSet {
            self.fetchActiveBuilds()
        }
    }

    var repositoryBuildsPublisher: RepositoryBuildResponsePublisher? {
        didSet {
            self.fetchRepositoryBuilds()
        }
    }

    var branchKeysPublisher: BuildKeyResponsePublisher? {
        didSet {
            self.fetchBranchKeys()
        }
    }

    var releaseKeysPublisher: BuildKeyResponsePublisher? {
        didSet {
            self.fetchReleaseKeys()
        }
    }

    var pullRequestKeysPublisher: BuildKeyResponsePublisher? {
        didSet {
            self.fetchPullRequestKeys()
        }
    }

    // MARK: - Initializer

    init(activeBuildsState: ViewModelState<[BuildStatus]> = .loading, repositoryBuildsState: ViewModelState<[RepositoryBuild]> = .loading) {
        self.activeBuildsState = activeBuildsState
        self.repositoryBuildsState = repositoryBuildsState
    }

    private func fetchActiveBuilds() {
        self.activeBuildsPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.activeBuildsState = .networkError(error)
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.activeBuildsState = .results(value)
            }
        }).store(in: &self.disposables)
    }
    
    private func fetchRepositoryBuilds() {
        self.repositoryBuildsPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.repositoryBuildsState = .networkError(error)
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.repositoryBuildsState = .results(value)
            }
        }).store(in: &self.disposables)
    }

    private func fetchBranchKeys() {
        self.branchKeysPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.branchKeysState = .networkError(error)
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.branchKeysState = .results(value)
            }
        }).store(in: &self.disposables)
    }

    private func fetchReleaseKeys() {
        self.releaseKeysPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.releaseKeysState = .networkError(error)
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.releaseKeysState = .results(value)
            }
        }).store(in: &self.disposables)
    }

    private func fetchPullRequestKeys() {
        self.pullRequestKeysPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.pullRequestKeysState = .networkError(error)
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.pullRequestKeysState = .results(value)
            }
        }).store(in: &self.disposables)
    }
}

#if DEBUG

extension RepositoryViewModel {
    static var someViewModel = RepositoryViewModel(activeBuildsState: .results(BuildStatus.activeBuilds),
                                                   repositoryBuildsState: .results(RepositoryBuild.someBuilds))
//    static var someViewModelOnlyBuilds = RepositoryViewModel(builds: RepositoryBuild.someBuilds)
//    static var someViewModelOnlyRecents = RepositoryViewModel(recent: BuildStatus.recentBuilds)
}
#endif
