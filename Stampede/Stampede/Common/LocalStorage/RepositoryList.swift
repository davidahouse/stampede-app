//
//  RepositoryList.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

protocol RepositoryListProvider {
    func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL]
    func fileExists(atPath path: String) -> Bool
    func write(_ data: Data, to: URL) throws
    func read(from: URL) throws -> Data
}

class RepositoryList: ObservableObject {
    
    private let provider: RepositoryListProvider
    private var repositories: [Repository] = []
    
    init(repositories: [Repository]? = nil, provider: RepositoryListProvider = FileManager.default) {
        self.provider = provider
        if let repositories = repositories {
            self.repositories = repositories
        } else {
            load()
        }
    }
 
    func addRepository(repository: Repository) {
        repositories.append(repository)
        save()
    }
    
    func removeRepository(repository: Repository) {
        repositories.removeAll(where: { $0.id == repository.id })
        save()
    }

    func removeRepositories(_ indexSet: IndexSet) {
        repositories.remove(atOffsets: indexSet)
        save()
    }
    
    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError> {
        return AnyPublisher<[Repository], ServiceError>(Future<[Repository], ServiceError> { promise in
                promise(.success(self.repositories))
        })
    }
    
    private func save() {
        let paths = provider.urls(for: .documentDirectory, in: .userDomainMask)
        guard let path = paths.first else {
            return
        }
        let filePath = path.appendingPathComponent("repositories.dat")
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(repositories)
            try provider.write(encoded, to: filePath)
        } catch {
            print("Error saving repository list")
        }
    }
    
    private func load() {
        let paths = provider.urls(for: .documentDirectory, in: .userDomainMask)
        guard let path = paths.first else {
            return
        }
        let filePath = path.appendingPathComponent("repositories.dat")
        guard provider.fileExists(atPath: filePath.path) else {
            repositories = []
            return
        }
        do {
            let rawData = try provider.read(from: filePath)
            let decoder = JSONDecoder()
            repositories = try decoder.decode([Repository].self, from: rawData)
        } catch {
            print("Error reading repository list")
        }
    }
}

extension FileManager: RepositoryListProvider {
    func write(_ data: Data, to: URL) throws {
        try data.write(to: to)
    }
    
    func read(from: URL) throws -> Data {
        return try Data(contentsOf: from)
    }
}
