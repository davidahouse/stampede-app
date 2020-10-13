//
//  RepositoryListFixture.swift
//  Stampede
//
//  Created by David House on 10/12/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

class RepositoryListFixture: RepositoryList, ObservableObject {
    
    private let provider: RepositoryListProvider
    private var repositories: [Repository] = []

    var addRepositoryCalled = false
    var removeRepositoryCalled = false
    var removeRepositoriesCalled = false
    var fetchRepositoriesPublisherCalled = false
    
    required init(repositories: [Repository]? = nil, provider: RepositoryListProvider = RepositoryListFixtureProvider()) {
        self.repositories = Repository.someRepositories
        self.provider = provider
    }
    
    func addRepository(repository: Repository) {
        repositories.append(repository)
        addRepositoryCalled = true
    }
    
    func removeRepository(repository: Repository) {
        repositories.removeAll(where: { $0.id == repository.id })
        removeRepositoryCalled = true
    }
    
    func removeRepositories(_ indexSet: IndexSet) {
        repositories.remove(atOffsets: indexSet)
        removeRepositoriesCalled = true
    }
    
    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError> {
        fetchRepositoriesPublisherCalled = true
        return AnyPublisher<[Repository], ServiceError>(Future<[Repository], ServiceError> { promise in
                promise(.success(self.repositories))
        })
    }
    
    
}

class RepositoryListFixtureProvider: RepositoryListProvider {
    func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL] {
        return []
    }
    
    func fileExists(atPath path: String) -> Bool {
        return true
    }
    
    func write(_ data: Data, to: URL) throws {
        
    }
    
    func read(from: URL) throws -> Data {
        return Data()
    }
}
