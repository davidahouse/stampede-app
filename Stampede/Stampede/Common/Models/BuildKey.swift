//
//  BuildKey.swift
//  Stampede
//
//  Created by David House on 7/18/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

public struct BuildKey: Codable, Identifiable, Equatable, Hashable {
    public let buildKey: String
    public let lastExecuted: Date?
    
    public var id: String {
        return buildKey
    }
    
    public var startedAgo: String {
        guard let started_at = lastExecuted else {
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

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

typealias BuildKeyResponsePublisher = AnyPublisher<[BuildKey], ServiceError>

#if DEBUG
extension BuildKey {
    static let someBranchKeys = [
        BuildKey(buildKey: "development", lastExecuted: Date().addingTimeInterval(-60*5)),
        BuildKey(buildKey: "main", lastExecuted: Date().addingTimeInterval(-60*105))
    ]
    static let someReleaseKeys = [
        BuildKey(buildKey: "v5.41", lastExecuted: Date().addingTimeInterval(-33)),
        BuildKey(buildKey: "v5.40", lastExecuted: Date().addingTimeInterval(-60*105)),
        BuildKey(buildKey: "v5.39", lastExecuted: Date().addingTimeInterval(-60*5))
    ]
    static let somePRKeys = [
        BuildKey(buildKey: "pullrequest-42", lastExecuted: Date().addingTimeInterval(-33)),
        BuildKey(buildKey: "pullrequest-41", lastExecuted: Date().addingTimeInterval(-60*105)),
        BuildKey(buildKey: "pullrequest-43", lastExecuted: Date().addingTimeInterval(-60*5))
    ]
}
#endif
