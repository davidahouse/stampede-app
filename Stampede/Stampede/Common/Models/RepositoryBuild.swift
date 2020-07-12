//
//  File.swift
//  
//
//  Created by David House on 5/24/20.
//

import Foundation

public struct RepositoryBuild: Codable, Identifiable, Equatable {
    public let build: String
    public let status: String
    public let message: String?
    public let buildID: String?
    public var id: String {
        if let buildID = buildID {
            return "\(buildID)"
        } else {
            return "\(build)"
        }
    }
}

#if DEBUG

extension RepositoryBuild {
    public static let someManualBuild = RepositoryBuild(build: "some-build", status: "idle", message: nil, buildID: nil)
    public static let someScheduledBuild = RepositoryBuild(build: "some-scheduled-build", status: "scheduled", message: "⏰ Build is scheduled to run at 9am every day", buildID: nil)
    public static let someActiveBuild = RepositoryBuild(build: "some-active-build", status: "active", message: nil, buildID: "some-active-build-id")

    public static let someBuilds = [RepositoryBuild.someManualBuild,
                                    RepositoryBuild.someActiveBuild,
                                    RepositoryBuild.someScheduledBuild]
}

#endif
