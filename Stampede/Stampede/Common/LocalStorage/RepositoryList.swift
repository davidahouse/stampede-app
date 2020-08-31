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

class RepositoryList: ObservableObject {
    
    private var repositories: [Repository] = []
    
    init(repositories: [Repository]? = nil) {
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
    
    func fetchRepositoriesPublisher() -> AnyPublisher<[Repository], ServiceError> {
        return AnyPublisher<[Repository], ServiceError>(Future<[Repository], ServiceError> { promise in
            DispatchQueue.main.async {
                promise(.success(self.repositories))
            }
        })
    }
    
    private func save() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let path = paths.first else {
            return
        }
        let filePath = path.appendingPathComponent("repositories.dat")
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(repositories)
            try encoded.write(to: filePath)
        } catch {
            print("Error saving repository list")
        }
    }
    
    private func load() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let path = paths.first else {
            return
        }
        let filePath = path.appendingPathComponent("repositories.dat")
        guard FileManager.default.fileExists(atPath: filePath.path) else {
            repositories = []
            return
        }
        do {
            let rawData = try Data(contentsOf: filePath)
            let decoder = JSONDecoder()
            repositories = try decoder.decode([Repository].self, from: rawData)
        } catch {
            print("Error reading repository list")
        }
    }
}
