//
//  ErrorPersona.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class ErrorPersona: Persona {

    var repositories: FixtureResponse<[Repository]> {
        .error(.network(description: "some network error happened"))
    }

    var repositoryActiveBuilds: FixtureResponse<[BuildStatus]> {
        .error(.network(description: "some network error happened"))
    }

    var repositoryBuilds: FixtureResponse<[RepositoryBuild]> {
        .error(.network(description: "some network error happened"))
    }

    var activeBuilds: FixtureResponse<[BuildStatus]> {
        .error(.network(description: "some network error happened"))
    }

    var queues: FixtureResponse<QueueSummaries> {
        .error(.network(description: "some network error happened"))
    }

    var workerStatus: FixtureResponse<[WorkerStatus]> {
        .error(.network(description: "some network error happened"))
    }

    var activeTasks: FixtureResponse<[TaskStatus]> {
        .error(.network(description: "some network error happened"))
    }

    var historyTasks: FixtureResponse<[TaskStatus]> {
        .error(.network(description: "some network error happened"))
    }

    var hourlySummary: FixtureResponse<[HourlySummary]> {
        .error(.network(description: "some network error happened"))
    }

    var tasks: FixtureResponse<[Task]> {
        .error(.network(description: "some network error happened"))
    }

    var configDefaults: FixtureResponse<ConfigDefaults> {
        .error(.network(description: "some network error happened"))
    }

    var configOverrides: FixtureResponse<ConfigOverrides> {
        .error(.network(description: "some network error happened"))
    }

    var configQueues: FixtureResponse<[Queue]> {
        .error(.network(description: "some network error happened"))
    }

    var buildKeys: FixtureResponse<[BuildKey]> {
        .error(.network(description: "some network error happened"))
    }

    var buildDetails: FixtureResponse<BuildStatus> {
        .error(.network(description: "some network error happened"))
    }

    var taskDetails: FixtureResponse<TaskDetails> {
        .error(.network(description: "some network error happened"))
    }

    var historyBuilds: FixtureResponse<[BuildDetails]> {
        .error(.network(description: "some network error happened"))
    }

    var repositorySourceBuilds: FixtureResponse<[BuildDetails]> {
        .error(.network(description: "some network error happened"))
    }
}
