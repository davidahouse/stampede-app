//
//  BuildKey.swift
//  Stampede
//
//  Created by David House on 7/18/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

public struct BuildKey: Codable, Identifiable, Equatable {
    public let build_key: String
    public let started_at: Date?
    
    public var id: String {
        return build_key
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

extension BuildKey: StandardCellModelable {

    func toStandardCellViewModel() -> StandardCellViewModel {
        return StandardCellViewModel(self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

#if DEBUG
extension BuildKey {
    static let someBranchKeys = [
        BuildKey(build_key: "development", started_at: Date().addingTimeInterval(-60*5)),
        BuildKey(build_key: "main", started_at: Date().addingTimeInterval(-60*105))
    ]
    static let someReleaseKeys = [
        BuildKey(build_key: "v5.41", started_at: Date().addingTimeInterval(-33)),
        BuildKey(build_key: "v5.40", started_at: Date().addingTimeInterval(-60*105)),
        BuildKey(build_key: "v5.39", started_at: Date().addingTimeInterval(-60*5))
    ]
    static let somePRKeys = [
        BuildKey(build_key: "pullrequest-42", started_at: Date().addingTimeInterval(-33)),
        BuildKey(build_key: "pullrequest-41", started_at: Date().addingTimeInterval(-60*105)),
        BuildKey(build_key: "pullrequest-43", started_at: Date().addingTimeInterval(-60*5))
    ]
}
#endif
