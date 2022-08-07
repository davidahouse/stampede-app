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

@MainActor
class RepositoryViewModel: ObservableObject {

    // MARK: - Published properties
    @Published public var repository: Repository
    @Published public var activeBuildsState: ViewModelState<[BuildStatus]> = .loading
    @Published public var repositoryBuildsState: ViewModelState<[RepositoryBuild]> = .loading

    @Published public var branchKeysState: ViewModelState<[BuildKey]> = .loading
    @Published public var releaseKeysState: ViewModelState<[BuildKey]> = .loading
    @Published public var pullRequestKeysState: ViewModelState<[BuildKey]> = .loading
    
    // MARK: - Properties

    // MARK: - Initializer

    init(repository: Repository, activeBuildsState: ViewModelState<[BuildStatus]> = .loading, repositoryBuildsState: ViewModelState<[RepositoryBuild]> = .loading) {
        self.repository = repository
        self.activeBuildsState = activeBuildsState
        self.repositoryBuildsState = repositoryBuildsState
    }
    
    public func fetch(service: StampedeService) async {
        activeBuildsState = await service.fetchActiveBuilds(owner: repository.owner, repository: repository.repository)
        repositoryBuildsState = await service.fetchRepositoryBuilds(owner: repository.owner, repository: repository.repository)
        branchKeysState = await service.fetchBuildKeys(owner: repository.owner, repository: repository.repository, source: "branch-push")
        releaseKeysState = await service.fetchBuildKeys(owner: repository.owner, repository: repository.repository, source: "release")
        pullRequestKeysState = await service.fetchBuildKeys(owner: repository.owner, repository: repository.repository, source: "pull-request")
    }
}

#if DEBUG

extension RepositoryViewModel {
    static var someViewModel = RepositoryViewModel(repository: Repository.someRepository,
                                                   activeBuildsState: .results(BuildStatus.activeBuilds),
                                                   repositoryBuildsState: .results(RepositoryBuild.someBuilds))
}
#endif
