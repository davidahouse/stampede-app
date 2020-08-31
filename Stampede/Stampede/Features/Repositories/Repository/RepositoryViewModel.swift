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

    @Published var branchKeys: [BuildKey] = []
    @Published var releaseKeys: [BuildKey] = []
    @Published var pullRequestKeys: [BuildKey] = []
    
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
    
    // MARK: - Initializer

    init(activeBuildsState: ViewModelState<[BuildStatus]> = .loading,
         activeBuildsPublisher: BuildStatusResponsePublisher? = nil,
         repositoryBuildsState: ViewModelState<[RepositoryBuild]> = .loading,
         repositoryBuildsPublisher: RepositoryBuildResponsePublisher? = nil) {
        self.activeBuildsState = activeBuildsState
        self.activeBuildsPublisher = activeBuildsPublisher
        self.repositoryBuildsState = repositoryBuildsState
        self.repositoryBuildsPublisher = repositoryBuildsPublisher
        fetchActiveBuilds()
        fetchRepositoryBuilds()
    }

    private func fetchActiveBuilds() {
        self.activeBuildsPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.activeBuildsState = .networkError
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
                self.repositoryBuildsState = .networkError
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.repositoryBuildsState = .results(value)
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
