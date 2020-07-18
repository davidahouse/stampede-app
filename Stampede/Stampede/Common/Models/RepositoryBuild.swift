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
    public let started_at: Date?
    public var id: String {
        if let buildID = buildID {
            return "\(buildID)"
        } else {
            return "\(build)"
        }
    }
    
    public var startedAgo: String {
        guard let started_at = started_at else {
            return ""
        }
        let interval = Date().timeIntervalSince(started_at)
        return "\(intervalToString(interval)) ago"
    }
    
    private func intervalToString(_ interval: TimeInterval) -> String {
        if interval < 60 {
            return "\(Int(round(interval))) sec(s)"
        } else if interval < 3600 {
            return "\(Int(round(interval / 60))) min(s)"
        } else {
            return "\(Int(round(interval / 3600))) hour(s)"
        }
    }
}

#if DEBUG

extension RepositoryBuild {
    public static let someManualBuild = RepositoryBuild(build: "some-build", status: "idle", message: nil, buildID: nil, started_at: Date().addingTimeInterval(-60*5))
    public static let someScheduledBuild = RepositoryBuild(build: "some-scheduled-build", status: "scheduled", message: "⏰ Build is scheduled to run at 9am every day", buildID: nil, started_at: Date().addingTimeInterval(-60*5))
    public static let someActiveBuild = RepositoryBuild(build: "some-active-build", status: "active", message: nil, buildID: "some-active-build-id", started_at: Date().addingTimeInterval(-60*5))

    public static let someBuilds = [RepositoryBuild.someManualBuild,
                                    RepositoryBuild.someActiveBuild,
                                    RepositoryBuild.someScheduledBuild]
}

#endif
