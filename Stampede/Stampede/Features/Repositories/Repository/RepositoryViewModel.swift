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

    @Published var fetchState: FetchState = .loading
    @Published var activeBuilds: [BuildStatus] = []
    @Published var repositoryBuilds: [RepositoryBuild] = []
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

    var buildsPublisher: AnyPublisher<[RepositoryBuild], StampedeError>? {
        didSet {
            self.fetch()
        }
    }

    var recentPublisher: AnyPublisher<[BuildStatus], StampedeError>? {
        didSet {
            self.fetch()
        }
    }
    
    // MARK: - Initializer

    init(activeBuildsState: ViewModelState<[BuildStatus]> = .loading,
         activeBuildsPublisher: BuildStatusResponsePublisher? = nil) {
        self.activeBuildsState = activeBuildsState
        self.activeBuildsPublisher = activeBuildsPublisher
        fetchActiveBuilds()
    }

    init(activeBuilds: [BuildStatus]? = nil, repositoryBuilds: [RepositoryBuild]? = nil, branchKeys: [BuildKey]? = nil, releaseKeys: [BuildKey]? = nil, pullRequestKeys: [BuildKey]? = nil) {
        if let activeBuilds = activeBuilds {
            self.activeBuilds = activeBuilds
        }
        if let repositoryBuilds = repositoryBuilds {
            self.repositoryBuilds = repositoryBuilds
        }
        if let branchKeys = branchKeys {
            self.branchKeys = branchKeys
        }
        if let releaseKeys = releaseKeys {
            self.releaseKeys = releaseKeys
        }
        if let pullRequestKeys = pullRequestKeys {
            self.pullRequestKeys = pullRequestKeys
        }
    }
    
    func fetch() {
//        self.buildsPublisher?.sink(receiveCompletion: { result in
//          if case let .failure(error) = result {
//            print("Error receiving \(error)")
//            DispatchQueue.main.async {
//                self.builds = .networkError
//            }
//          }
//        }, receiveValue: { value in
//            DispatchQueue.main.async {
//                if value.count > 0 {
//                    self.builds = .hasResults(results: value)
//                } else {
//                    self.builds = .empty(message: "No builds found")
//                }
//            }
//        }).store(in: &self.disposables)
//
//        self.recentPublisher?.sink(receiveCompletion: { result in
//          if case let .failure(error) = result {
//            print("Error receiving \(error)")
//            DispatchQueue.main.async {
//                self.recent = .networkError
//            }
//          }
//        }, receiveValue: { value in
//            DispatchQueue.main.async {
//                if value.count > 0 {
//                    self.recent = .hasResults(results: value)
//                } else {
//                    self.recent = .empty(message: "No recent builds found")
//                }
//            }
//        }).store(in: &self.disposables)
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
}

#if DEBUG

extension RepositoryViewModel {
    static var someViewModel = RepositoryViewModel(activeBuilds: BuildStatus.activeBuilds, repositoryBuilds: RepositoryBuild.someBuilds, branchKeys: BuildKey.someBranchKeys, releaseKeys: BuildKey.someReleaseKeys, pullRequestKeys: BuildKey.somePRKeys)
//    static var someViewModelOnlyBuilds = RepositoryViewModel(builds: RepositoryBuild.someBuilds)
//    static var someViewModelOnlyRecents = RepositoryViewModel(recent: BuildStatus.recentBuilds)
}
#endif
