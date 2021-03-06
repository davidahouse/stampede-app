//
//  File.swift
//  
//
//  Created by David House on 5/24/20.
//

import Foundation
import Combine
import HouseKit

public struct RepositoryBuild: Codable, Identifiable, Equatable, Hashable {
    public let build: String
    public let lastExecuted: Date?
    public var id: String {
        return "\(build)"
    }

    public var completedAgo: String {
        guard let completed = lastExecuted else {
            return ""
        }
        return completed.ago()
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

typealias RepositoryBuildResponsePublisher = AnyPublisher<[RepositoryBuild], ServiceError>

#if DEBUG

extension RepositoryBuild {
    public static let someBuild = RepositoryBuild(build: "some-build", lastExecuted: Date.fixtureDate.addingTimeInterval(-60*5))
    public static let someOtherBuild = RepositoryBuild(build: "some-other-build", lastExecuted: nil)
    public static let someBuildCompletedSecondsAgo = RepositoryBuild(build: "some-build", lastExecuted: Date.fixtureDate.addingTimeInterval(-12))
    public static let someBuildCompletedMinutesAgo = RepositoryBuild(build: "some-build", lastExecuted: Date.fixtureDate.addingTimeInterval(-12*60))
    public static let someBuildCompletedHoursAgo = RepositoryBuild(build: "some-build", lastExecuted: Date.fixtureDate.addingTimeInterval(-12*60*60))

    public static let someBuilds = [RepositoryBuild.someBuild,
                                    RepositoryBuild.someOtherBuild]
}

#endif
