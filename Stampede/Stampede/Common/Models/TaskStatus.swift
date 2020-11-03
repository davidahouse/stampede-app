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
        return started.ago()
    }

    public var duration: String {
        guard let started = started_at else {
            return ""
        }

        if let completed = completed_at {
            let interval = completed.timeIntervalSince(started)
            return interval.duration()
        } else {
            let interval = Date().timeIntervalSince(started)
            return interval.duration()
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
    public static let completedTask = TaskStatus(task_id: "8681", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "completed", conclusion: "success", queued_at: Date.fixtureDate.addingTimeInterval(-12), started_at: Date.fixtureDate.addingTimeInterval(-12), finished_at: Date.fixtureDate, completed_at: Date.fixtureDate, node: "some-node")
    public static let failedTask = TaskStatus(task_id: "8682", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "completed", conclusion: "failure", queued_at: Date.fixtureDate.addingTimeInterval(-12), started_at: Date.fixtureDate.addingTimeInterval(-12), finished_at: Date.fixtureDate, completed_at: Date.fixtureDate, node: "some-node")
    public static let activeTasks = [TaskStatus.queuedTask, TaskStatus.inProgressTask]
    public static let recentTasks = [TaskStatus.completedTask, TaskStatus.failedTask]
    public static let noTasks: [TaskStatus] = []
    
    public static let taskWithNoOwner = TaskStatus(task_id: "123", build_id: "1245", owner: nil, repository: "some-repo", build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date(), started_at: nil, finished_at: nil, completed_at: nil, node: nil)
    public static let taskWithNoRepository = TaskStatus(task_id: "123", build_id: "1245", owner: "some-owner", repository: nil, build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date(), started_at: nil, finished_at: nil, completed_at: nil, node: nil)
    public static let taskWithNoBuildKey = TaskStatus(task_id: "123", build_id: "1245", owner: "some-owner", repository: "some-repo", build_key: nil, task: "some-task", status: "started", conclusion: nil, queued_at: Date(), started_at: nil, finished_at: nil, completed_at: nil, node: nil)

    public static let taskStartedSecondsAgo = TaskStatus(task_id: "8679", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date().addingTimeInterval(-12), started_at: Date().addingTimeInterval(-12), finished_at: nil, completed_at: nil, node: "some-node")
    public static let taskStartedMinutesAgo = TaskStatus(task_id: "8679", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date().addingTimeInterval(-12), started_at: Date().addingTimeInterval(-12*60), finished_at: nil, completed_at: nil, node: "some-node")
    public static let taskStartedHoursAgo = TaskStatus(task_id: "8679", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date().addingTimeInterval(-12), started_at: Date().addingTimeInterval(-12*60*60), finished_at: nil, completed_at: nil, node: "some-node")
    
    public static let taskCompletedInSeconds = TaskStatus(task_id: "8679", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date().addingTimeInterval(-12), started_at: Date().addingTimeInterval(-11), finished_at: Date().addingTimeInterval(-10), completed_at: Date().addingTimeInterval(-9), node: "some-node")
    public static let taskCompletedInMinutes = TaskStatus(task_id: "8679", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date().addingTimeInterval(-12*60), started_at: Date().addingTimeInterval(-11*60), finished_at: Date().addingTimeInterval(-10), completed_at: Date().addingTimeInterval(-9), node: "some-node")
    public static let taskCompletedInHours = TaskStatus(task_id: "8679", build_id: "12345", owner: "some-org", repository: "some-repo", build_key: "some-key", task: "some-task", status: "started", conclusion: nil, queued_at: Date().addingTimeInterval(-12*60*60), started_at: Date().addingTimeInterval(-11*60*60), finished_at: Date().addingTimeInterval(-10), completed_at: Date().addingTimeInterval(-9), node: "some-node")
}

#endif
