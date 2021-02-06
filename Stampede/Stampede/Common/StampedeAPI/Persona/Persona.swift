//
//  Persona.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

protocol Persona {
    var repositories: FixtureResponse<[Repository]> { get }
    var repositoryActiveBuilds: FixtureResponse<[BuildStatus]> { get }
    var repositoryBuilds: FixtureResponse<[RepositoryBuild]> { get }
    var activeBuilds: FixtureResponse<[BuildStatus]> { get }
    var queues: FixtureResponse<QueueSummaries> { get }
    var workerStatus: FixtureResponse<[WorkerStatus]> { get }
    var activeTasks: FixtureResponse<[TaskStatus]> { get }
    var historyTasks: FixtureResponse<[TaskStatus]> { get }
    var hourlySummary: FixtureResponse<[HourlySummary]> { get }
    var tasks: FixtureResponse<[Task]> { get }
    var configDefaults: FixtureResponse<ConfigDefaults> { get }
    var configOverrides: FixtureResponse<ConfigOverrides> { get }
    var configQueues: FixtureResponse<[Queue]> { get }
    var buildKeys: FixtureResponse<[BuildKey]> { get }
    var buildDetails: FixtureResponse<BuildStatus> { get }
    var taskDetails: FixtureResponse<TaskDetails> { get }
    var historyBuilds: FixtureResponse<[BuildDetails]> { get }
    var repositorySourceBuilds: FixtureResponse<[BuildDetails]> { get }
}
