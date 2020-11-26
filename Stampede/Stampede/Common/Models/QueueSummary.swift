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

public struct QueueSummaries: Codable, Equatable {
    public let taskQueues: [QueueSummary]
    public let systemQueues: [QueueSummary]
}

typealias QueueSummaryResponsePublisher = AnyPublisher<[QueueSummaries], ServiceError>

#if DEBUG

extension QueueSummary {
    public static let noWaiting = QueueSummary(queue: "some queue", stats: QueueSummaryStats(waiting: 0, active: 0, completed: 0, failed: 0, delayed: 0, paused: 0))
    public static let oneWaiting = QueueSummary(queue: "some other queue", stats: QueueSummaryStats(waiting: 1, active: 0, completed: 0, failed: 0, delayed: 0, paused: 0))
    public static let moreWaiting = QueueSummary(queue: "some third queue", stats: QueueSummaryStats(waiting: 5, active: 0, completed: 0, failed: 0, delayed: 0, paused: 0))
    public static let alotWaiting = QueueSummary(queue: "some fourth queue", stats: QueueSummaryStats(waiting: 15, active: 0, completed: 0, failed: 0, delayed: 0, paused: 0))
    
    public static let someSummaries = [QueueSummary.noWaiting,
                                QueueSummary.oneWaiting,
                                QueueSummary.moreWaiting,
                                QueueSummary.alotWaiting]
}

extension QueueSummaries {
    public static let someSummaries = QueueSummaries(taskQueues: QueueSummary.someSummaries, systemQueues: QueueSummary.someSummaries)
}

#endif
