//
//  LoadingPersona.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class LoadingPersona: Persona {
    var repositories: FixtureResponse<[Repository]> {
        .loading
    }

    var repositoryActiveBuilds: FixtureResponse<[BuildStatus]> {
        .loading
    }

    var repositoryBuilds: FixtureResponse<[RepositoryBuild]> {
        .loading
    }

    var activeBuilds: FixtureResponse<[BuildStatus]> {
        .loading
    }

    var queues: FixtureResponse<QueueSummaries> {
        .loading
    }

    var workerStatus: FixtureResponse<[WorkerStatus]> {
        .loading
    }

    var activeTasks: FixtureResponse<[TaskStatus]> {
        .loading
    }

    var historyTasks: FixtureResponse<[TaskStatus]> {
        .loading
    }

    var hourlySummary: FixtureResponse<[HourlySummary]> {
        .loading
    }

    var tasks: FixtureResponse<[Task]> {
        .loading
    }

    var configDefaults: FixtureResponse<ConfigDefaults> {
        .loading
    }

    var configOverrides: FixtureResponse<ConfigOverrides> {
        .loading
    }

    var configQueues: FixtureResponse<[Queue]> {
        .loading
    }

    var buildKeys: FixtureResponse<[BuildKey]> {
        .loading
    }

    var buildDetails: FixtureResponse<BuildStatus> {
        .loading
    }

    var taskDetails: FixtureResponse<TaskDetails> {
        .loading
    }

    var historyBuilds: FixtureResponse<[BuildDetails]> {
        .loading
    }

    var repositorySourceBuilds: FixtureResponse<[BuildDetails]> {
        .loading
    }
}
