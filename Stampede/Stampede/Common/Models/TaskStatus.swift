//
//  TaskStatus.swift
//  Stampede
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import HouseKit
import Combine

public struct TaskStatus: Codable, Identifiable, Equatable, Hashable {
    public let task_id: String
    public let build_id: String
    public let owner: String?
    public let repository: String?
    public let build_key: String?
    public let task: String
    public let status: String
    public let conclusion: String?
    public let queued_at: Date
    public let started_at: Date?
    public let finished_at: Date?
    public let completed_at: Date?
    public let node: String?

    public var id: String {
        return task_id
    }
    
    public var buildTitle: String? {
        guard let owner = owner, let repository = repository, let build_key = build_key else {
            return nil
        }

        return "\(owner) / \(repository) / \(build_key)"
    }
    
    public var startedAgo: String {
        guard let started = started_at else {
            return ""
        }
        let interval = Date().timeIntervalSince(started)
        return "\(intervalToString(interval)) ago"
    }

    public var duration: String {
        guard let started = started_at else {
            return ""
        }

        if let completed = completed_at {
            let interval = completed.timeIntervalSince(started)
            return intervalToString(interval)
        } else {
            let interval = Date().timeIntervalSince(started)
            return intervalToString(interval)
        }
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

    public var workerPath: String {
        return ""
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

typealias TaskStatusResponsePublisher = AnyPublisher<[TaskStatus], ServiceError>

#if DEBUG

extension TaskStatus {
    public static let queuedTask = TaskStatus(task_id: "8679", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date(), started_at: nil, finished_at: nil, completed_at: nil, node: "some-node")
    public static let inProgressTask = TaskStatus(task_id: "8680", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "inprogress", conclusion: nil, queued_at: Date(), started_at: Date(), finished_at: nil, completed_at: nil, node: "some-node")
    public static let completedTask = TaskStatus(task_id: "8681", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "completed", conclusion: "success", queued_at: Date(), started_at: Date(), finished_at: Date(), completed_at: Date(), node: "some-node")
    public static let failedTask = TaskStatus(task_id: "8682", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "completed", conclusion: "failure", queued_at: Date(), started_at: nil, finished_at: Date(), completed_at: Date(), node: "some-node")
    public static let activeTasks = [TaskStatus.queuedTask, TaskStatus.inProgressTask]
    public static let recentTasks = [TaskStatus.completedTask, TaskStatus.failedTask]
    public static let noTasks: [TaskStatus] = []
}

#endif
