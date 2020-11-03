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
    public let reference_date: Date?

    public var duration: String {
        if let completed = completed_at {
            let interval = completed.timeIntervalSince(started_at)
            return interval.duration()
        } else {
            let interval = (reference_date ?? Date()).timeIntervalSince(started_at)
            return interval.duration()
        }
    }

    public var completedAgo: String {
        guard let completed = completed_at else {
            return "still running"
        }
        return completed.ago(reference_date ?? Date())
    }
}

typealias BuildDetailsResponsePublisher = AnyPublisher<[BuildDetails], ServiceError>

#if DEBUG

extension BuildDetails {
    public static let activeBuild = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date.fixtureDate.addingTimeInterval(-60*5), completed_at: nil, reference_date: Date.fixtureDate.addingTimeInterval(42))
    public static let completedBuild = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 13, status: "success", started_at: Date.fixtureDate.addingTimeInterval(-60*5), completed_at: Date.fixtureDate, reference_date: Date.fixtureDate.addingTimeInterval(42))
    
    public static let buildStartedSecondsAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12), completed_at: nil, reference_date: nil)
    public static let buildStartedMinutesAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12*60), completed_at: nil, reference_date: nil)
    public static let buildStartedHoursAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12*60*60), completed_at: nil, reference_date: nil)
    
    public static let buildCompletedSecondsAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12), completed_at: Date().addingTimeInterval(-11), reference_date: nil)
    public static let buildCompletedMinutesAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12*60), completed_at: Date().addingTimeInterval(-11*60), reference_date: nil)
    public static let buildCompletedHoursAgo = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-12*60*60), completed_at: Date().addingTimeInterval(-11*60*60), reference_date: nil)

}

#endif
