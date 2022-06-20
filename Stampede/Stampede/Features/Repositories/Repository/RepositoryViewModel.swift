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
        
        print("Fetching from RepositoryViewModel")
        objectWillChange.send()

        let activeBuilds = await service.fetchActiveBuilds(owner: repository.owner, repository: repository.repository)
        switch activeBuilds {
        case .failure(let error):
            activeBuildsState = .networkError(error)
        case .success(let builds):
            activeBuildsState = .results(builds)
            print("there were \(builds.count) builds")
        }
        repository = Repository(owner: "this", repository: "is-fetched")
        
//        let repositoryBuilds = await service.fetchRepositoryBuilds(owner: repository.owner, repository: repository.repository)
//        switch repositoryBuilds {
//        case .failure(let error):
//            repositoryBuildsState = .networkError(error)
//        case .success(let builds):
//            repositoryBuildsState = .results(builds)
//        }
//        
//        let branchKeys = await service.fetchBuildKeys(owner: repository.owner, repository: repository.repository, source: "branch-push")
//        switch branchKeys {
//        case .failure(let error):
//            branchKeysState = .networkError(error)
//        case .success(let keys):
//            branchKeysState = .results(keys)
//        }
//
//        let releases = await service.fetchBuildKeys(owner: repository.owner, repository: repository.repository, source: "release")
//        switch releases {
//        case .failure(let error):
//            releaseKeysState = .networkError(error)
//        case .success(let keys):
//            releaseKeysState = .results(keys)
//        }
//
//        let pullRequests = await service.fetchBuildKeys(owner: repository.owner, repository: repository.repository, source: "pull-request")
//        switch pullRequests {
//        case .failure(let error):
//            pullRequestKeysState = .networkError(error)
//        case .success(let keys):
//            pullRequestKeysState = .results(keys)
//        }
    }
}

#if DEBUG

extension RepositoryViewModel {
    static var someViewModel = RepositoryViewModel(repository: Repository.someRepository,
                                                   activeBuildsState: .results(BuildStatus.activeBuilds),
                                                   repositoryBuildsState: .results(RepositoryBuild.someBuilds))
}
#endif
