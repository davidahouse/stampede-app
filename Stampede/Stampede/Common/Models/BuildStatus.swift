//
//  BuildStatus.swift
//  Stampede
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

public enum BuildStatusIndicator {
    case inProgress
    case success
    case failure
}

public struct BuildStatus: Codable, Identifiable, Equatable, Hashable {
    public var id: String {
        return buildID
    }

    public let buildID: String
    public let buildDetails: BuildDetails
    public let tasks: [TaskStatus]

    public var statusIndicator: BuildStatusIndicator {
        if buildDetails.status == "in_progress" {
            return .inProgress
        }

        if tasks.first(where: { $0.conclusion == "failure"}) != nil {
            return .failure
        } else {
            return .success
        }
    }

    public var startedAgo: String {
        let interval = Date().timeIntervalSince(buildDetails.started_at)
        return "\(intervalToString(interval)) ago"
    }

    public var duration: String {
        if let completed = buildDetails.completed_at {
            let interval = completed.timeIntervalSince(buildDetails.started_at)
            return intervalToString(interval)
        } else {
            let interval = Date().timeIntervalSince(buildDetails.started_at)
            return intervalToString(interval)
        }
    }
    
    public var completedAgo: String {
        guard let completed = buildDetails.completed_at else {
            return "still running"
        }

        let interval = Date().timeIntervalSince(completed)
        return "\(intervalToString(interval)) ago"
    }
    
    public var buildIdentifier: String {
        return "\(buildDetails.build_key)-\(buildDetails.build)"
    }
    
    public var buildRepository: String {
        return "\(buildDetails.owner) / \(buildDetails.repository)"
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

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

typealias BuildStatusResponsePublisher = AnyPublisher<[BuildStatus], ServiceError>

#if DEBUG

extension BuildStatus {
    public static let someActiveBuild = BuildStatus(buildID: "12345", buildDetails: BuildDetails.activeBuild, tasks: [TaskStatus.inProgressTask, TaskStatus.queuedTask])
    public static let someActiveSuccessBuild = BuildStatus(buildID: "12345", buildDetails: BuildDetails.activeBuild, tasks: [TaskStatus.completedTask])
    public static let someActiveFailedBuild = BuildStatus(buildID: "1442", buildDetails: BuildDetails.activeBuild, tasks: [TaskStatus.failedTask])
    public static let someRecentBuild = BuildStatus(buildID: "123467", buildDetails: BuildDetails.completedBuild, tasks: [TaskStatus.completedTask, TaskStatus.failedTask])
    public static let someRecentSuccessBuild = BuildStatus(buildID: "123467", buildDetails: BuildDetails.completedBuild, tasks: [TaskStatus.completedTask])
    public static let someRecentFailedBuild = BuildStatus(buildID: "123467", buildDetails: BuildDetails.completedBuild, tasks: [TaskStatus.failedTask])

    public static let activeBuilds = [BuildStatus.someActiveBuild, BuildStatus.someActiveSuccessBuild, BuildStatus.someActiveFailedBuild]
    public static let recentBuilds = [BuildStatus.someRecentBuild, BuildStatus.someRecentSuccessBuild, BuildStatus.someRecentFailedBuild]
    
    public static let buildStartedSecondsAgo = BuildStatus(buildID: "12345", buildDetails: BuildDetails.buildStartedSecondsAgo, tasks: [TaskStatus.inProgressTask, TaskStatus.queuedTask])
    public static let buildStartedMinutesAgo = BuildStatus(buildID: "12345", buildDetails: BuildDetails.buildStartedMinutesAgo, tasks: [TaskStatus.inProgressTask, TaskStatus.queuedTask])
    public static let buildStartedHoursAgo = BuildStatus(buildID: "12345", buildDetails: BuildDetails.buildStartedHoursAgo, tasks: [TaskStatus.inProgressTask, TaskStatus.queuedTask])
    
    public static let buildCompletedSecondsAgo = BuildStatus(buildID: "12345", buildDetails: BuildDetails.buildCompletedSecondsAgo, tasks: [TaskStatus.inProgressTask, TaskStatus.queuedTask])
    public static let buildCompletedMinutesAgo = BuildStatus(buildID: "12345", buildDetails: BuildDetails.buildCompletedMinutesAgo, tasks: [TaskStatus.inProgressTask, TaskStatus.queuedTask])
    public static let buildCompletedHoursAgo = BuildStatus(buildID: "12345", buildDetails: BuildDetails.buildCompletedHoursAgo, tasks: [TaskStatus.inProgressTask, TaskStatus.queuedTask])
}

#endif
