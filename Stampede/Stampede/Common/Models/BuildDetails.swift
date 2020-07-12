//
//  BuildDetails.swift
//  Stampede
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public struct BuildDetails: Codable, Equatable {
    public let build_id: String
    public let owner: String
    public let repository: String
    public let build_key: String
    public let build: Int
    public let status: String
    public let started_at: Date
    public let completed_at: Date?
}

#if DEBUG

extension BuildDetails {
    public static let activeBuild = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "in_progress", started_at: Date().addingTimeInterval(-60*5), completed_at: nil)
    public static let completedBuild = BuildDetails(build_id: "12345", owner: "davidahouse", repository: "some-repository", build_key: "pullrequest-42", build: 12, status: "success", started_at: Date().addingTimeInterval(-60*5), completed_at: Date())
}

#endif
