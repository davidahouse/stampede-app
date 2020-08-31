//
//  File.swift
//  
//
//  Created by David House on 5/24/20.
//

import Foundation

public struct RepositoryBuild: Codable, Identifiable, Equatable, Hashable {
    public let build: String
    public let lastExecuted: Date?
    public var id: String {
        return "\(build)"
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

#if DEBUG

extension RepositoryBuild {
    public static let someBuild = RepositoryBuild(build: "some-build", lastExecuted: Date().addingTimeInterval(-60*5))
    public static let someOtherBuild = RepositoryBuild(build: "some-other-build", lastExecuted: nil)

    public static let someBuilds = [RepositoryBuild.someBuild,
                                    RepositoryBuild.someOtherBuild]
}

#endif
