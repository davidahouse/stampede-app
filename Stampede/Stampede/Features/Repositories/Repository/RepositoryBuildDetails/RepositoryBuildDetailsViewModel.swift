//
//  RepositoryBuildDetailsViewModel.swift
//  Stampede
//
//  Created by David House on 10/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit
import Combine

class RepositoryBuildDetailsViewModel: ObservableObject {

    @Published public var repository: Repository
    @Published public var build: String
    @Published public var activeBuildsState: ViewModelState<[BuildStatus]> = .loading
    @Published public var recentBuildsState: ViewModelState<[BuildDetails]> = .loading

    private var disposables = Set<AnyCancellable>()

    var activeBuildsPublisher: BuildStatusResponsePublisher? {
        didSet {
            self.fetchActiveBuilds()
        }
    }

    var recentBuildsPublisher: BuildDetailsResponsePublisher? {
        didSet {
            self.fetchRecentBuilds()
        }
    }

    // MARK: - Initializer

    init(repository: Repository, build: String, activeBuildsState: ViewModelState<[BuildStatus]> = .loading, recentBuildsState: ViewModelState<[BuildDetails]> = .loading) {
        self.repository = repository
        self.build = build
        self.activeBuildsState = activeBuildsState
        self.recentBuildsState = recentBuildsState
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
                let activeBuild = value.filter { $0.buildDetails.build_key == self.build}
                self.activeBuildsState = .results(activeBuild)
            }
        }).store(in: &self.disposables)
    }

    private func fetchRecentBuilds() {
        self.recentBuildsPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.recentBuildsState = .networkError(error)
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.recentBuildsState = .results(value)
            }
        }).store(in: &self.disposables)
    }
}

#if DEBUG
extension RepositoryBuildDetailsViewModel {
    static let someViewModel = RepositoryBuildDetailsViewModel(repository: Repository.someRepository,
                                                               build: "someBuild",
                                                               activeBuildsState: .results(BuildStatus.activeBuilds),
                                                               recentBuildsState: .results([BuildDetails.completedBuild]))
}
#endif
