//
//  Repository.swift
//  Stampede
//
//  Created by David House on 10/12/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public struct Repository: Codable, Identifiable, Equatable, Hashable {
    public let owner: String
    public let repository: String
    public var id: String {
        return "\(owner)-\(repository)"
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

#if DEBUG
extension Repository {
    public static let someRepository = Repository(owner: "davidahouse", repository: "some-repository")
    public static let anotherRepository = Repository(owner: "davidahouse", repository: "another-repository")
    public static let someRepositories = [Repository.someRepository, Repository.anotherRepository]
}
#endif
