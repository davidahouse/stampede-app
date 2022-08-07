//
//  TaskDetails.swift
//  Stampede
//
//  Created by David House on 10/17/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit
import Combine

public struct TaskDetails: Codable, Equatable, Hashable {
    let task: TaskStatus
    let summary: String
    let text: String
    let artifacts: [TaskArtifact]
    let scmDetails: [TaskSCMDetails]
}

typealias TaskDetailsResponsePublisher = AnyPublisher<TaskDetails, ServiceError>

#if DEBUG
extension TaskDetails {
    static let someTaskDetails = TaskDetails(task: TaskStatus.completedTask,
                                             summary: "some summary text",
                                             text: "### Text header\n\n- list item\n- another **list** item",
                                             artifacts: TaskArtifact.someArtifacts,
                                             scmDetails: TaskSCMDetails.someDetails)
}
#endif
