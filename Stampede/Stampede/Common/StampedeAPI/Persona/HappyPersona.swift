//
//  HappyPersona.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class HappyPersona: Persona {

    var repositories: FixtureResponse<[Repository]> {
        .results(Repository.someRepositories)
    }

    var repositoryActiveBuilds: FixtureResponse<[BuildStatus]> {
        .results(BuildStatus.activeBuilds)
    }

    var repositoryBuilds: FixtureResponse<[RepositoryBuild]> {
        .results(RepositoryBuild.someBuilds)
    }

    var activeBuilds: FixtureResponse<[BuildStatus]> {
        .results(BuildStatus.activeBuilds)
    }

    var queues: FixtureResponse<[QueueSummary]> {
        .results(QueueSummary.someSummaries)
    }

    var workerStatus: FixtureResponse<[WorkerStatus]> {
        .results(WorkerStatus.workerStatuses)
    }

    var activeTasks: FixtureResponse<[TaskStatus]> {
        .results(TaskStatus.activeTasks)
    }

    var historyTasks: FixtureResponse<[TaskStatus]> {
        .results(TaskStatus.recentTasks)
    }

    var hourlySummary: FixtureResponse<[HourlySummary]> {
        .results(HourlySummary.someSummaries)
    }

    var tasks: FixtureResponse<[Task]> {
        .results(Task.someTasks)
    }

    var configDefaults: FixtureResponse<ConfigDefaults> {
        .results(ConfigDefaults.someDefaults)
    }

    var configOverrides: FixtureResponse<ConfigOverrides> {
        .results(ConfigOverrides.someOverrides)
    }

    var configQueues: FixtureResponse<[Queue]> {
        .results(Queue.someQueues)
    }

    var buildKeys: FixtureResponse<[BuildKey]> {
        .results(BuildKey.someBranchKeys)
    }

    var buildDetails: FixtureResponse<BuildStatus> {
        .results(BuildStatus.buildCompletedHoursAgo)
    }

    var taskDetails: FixtureResponse<TaskDetails> {
        .results(TaskDetails.someTaskDetails)
    }

    var artifactCloc: FixtureResponse<ArtifactCloc> {
        .results(ArtifactCloc.someCloc)
    }

    var artifactXcodebuild: FixtureResponse<ArtifactXcodebuild> {
        .results(ArtifactXcodebuild.someXcodebuild)
    }

    var historyBuilds: FixtureResponse<[BuildDetails]> {
        .results([BuildDetails.completedBuild])
    }

    var repositorySourceBuilds: FixtureResponse<[BuildDetails]> {
        .results([BuildDetails.completedBuild])
    }
}
