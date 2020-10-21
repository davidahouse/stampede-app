//
//  BuildDetails.swift
//  Stampede
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import HouseKit
import Combine

public struct BuildDetails: Codable, Equatable, Hashable {
    public let build_id: String
    public let owner: String
    public let repository: String
    public let build_key: String
    public let build: Int
    public let status: String
    public let started_at: Date
    public let completed_at: Date?

    public var duration: String {
        if let completed = completed_at {
            let interval = completed.timeIntervalSince(started_at)
            return interval.duration()
        } else {
            let interval = Date().timeIntervalSince(started_at)
            return interval.duration()
        }
    }

    public var completedAgo: String {
        guard let completed = completed_at else {
            return "still running"
        }
        return completed.ago()
    }
}

typealias BuildDetailsResponsePublisher = AnyPublisher<[BuildDetails], ServiceError>

#if DEBUG

extension BuildDetails {
    public static let activeBuild = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-60*5), completed_at: nil)
    public static let completedBuild = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "success", started_at: Date().addingTimeInterval(-60*5), completed_at: Date())
    
    public static let buildStartedSecondsAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12), completed_at: nil)
    public static let buildStartedMinutesAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12*60), completed_at: nil)
    public static let buildStartedHoursAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12*60*60), completed_at: nil)
    
    public static let buildCompletedSecondsAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12), completed_at: Date().addingTimeInterval(-11))
    public static let buildCompletedMinutesAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12*60), completed_at: Date().addingTimeInterval(-11*60))
    public static let buildCompletedHoursAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12*60*60), completed_at: Date().addingTimeInterval(-11*60*60))

}

#endif
