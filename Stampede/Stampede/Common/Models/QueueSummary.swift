//
//  QueueSummary.swift
//  Stampede-Mobile
//
//  Created by David House on 12/7/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

public struct QueueSummaryStats: Codable, Equatable {
    public let waiting: Int
    public let active: Int
    public let completed: Int
    public let failed: Int
    public let delayed: Int
    public let paused: Int
}

public struct QueueSummary: Codable, Equatable, Identifiable, Hashable {
    public let queue: String
    public let stats: QueueSummaryStats
    
    public var id: String {
        return queue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

typealias QueueSummaryResponsePublisher = AnyPublisher<[QueueSummary], ServiceError>

#if DEBUG

extension QueueSummary {
    public static let someSummary = QueueSummary(queue: "some queue", stats: QueueSummaryStats(waiting: 10, active: 1, completed: 0, failed: 0, delayed: 0, paused: 0))
    public static let someOtherSummary = QueueSummary(queue: "some other queue", stats: QueueSummaryStats(waiting: 5, active: 1, completed: 0, failed: 0, delayed: 0, paused: 0))
    public static let someThirdSummary = QueueSummary(queue: "some third queue", stats: QueueSummaryStats(waiting: 0, active: 1, completed: 0, failed: 0, delayed: 0, paused: 0))
    public static let someSummaries = [QueueSummary.someSummary,
                                QueueSummary.someOtherSummary,
                                QueueSummary.someThirdSummary]
}

#endif
