//
//  TaskConfig.swift
//  Stampede
//
//  Created by David House on 10/20/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public struct Task: Codable, Identifiable, Equatable {
    public let id: String
    public let config: TaskConfig
}

public struct TaskConfig: Codable, Equatable {
    public let id: String
    public let title: String
    public let config: [TaskConfigParameter]?
    public let worker: TaskWorkerConfig?
}

public struct TaskConfigParameter: Codable, Equatable {
    public let key: String
}

public struct TaskWorkerConfig: Codable, Equatable {
    public let taskCommand: String
}

#if DEBUG

extension Task {
    public static let someTask = Task(id: "some-task", config: TaskConfig(id: "some-task", title: "Some Task", config: nil, worker: nil))
    public static let someOtherTask = Task(id: "some-other-task", config: TaskConfig(id: "some-other-task", title: "Some Other Task", config: nil, worker: nil))
    
    public static let someTasks = [someTask, someOtherTask]
}

#endif
