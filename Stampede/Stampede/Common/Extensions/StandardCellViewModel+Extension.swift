//
//  StandardCellViewModel+Extension.swift
//  Stampede-Mobile
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import StampedeCommon

extension StandardCellViewModel {
    
    init(_ task: Task) {
        title = task.config.title
        subtitle = task.id
        id = task.id
        icon = nil
        value = nil
    }

    init(_ repository: Repository) {
        title = repository.owner
        subtitle = repository.repository
        id = "\(repository.owner)-\(repository.repository)"
        icon = nil
        value = nil
    }
    
    init(_ taskStatus: TaskStatus) {
        title = taskStatus.task
        subtitle = taskStatus.buildTitle
        value = taskStatus.duration
        id = taskStatus.task_id
        switch taskStatus.status {
        case "inProgress":
            icon = .inProgress
        default:
            switch taskStatus.conclusion {
            case "success":
                icon = .success
            default:
                icon = .failure
            }
        }
    }
    
    init(_ queueSummary: QueueSummary) {
        title = queueSummary.queue
        subtitle = nil
        id = queueSummary.queue
        
        switch queueSummary.stats.waiting {
        case 0:
            value = "No waiting tasks"
        case 1:
            value = "1 waiting task"
        default:
            value = "\(queueSummary.stats.waiting) waiting tasks"
        }
        
        switch queueSummary.stats.waiting {
        case 0..<3:
            icon = .okStatus
        case 3..<6:
            icon = .warningStatus
        default:
            icon = .errorStatus
        }
    }
    
    init(_ queue: Queue) {
        title = queue.title
        subtitle = queue.id
        value = nil
        id = queue.id
        icon = nil
    }
    
    init(_ buildStatus: BuildStatus) {
        title = buildStatus.buildIdentifier
        subtitle = nil
        value = buildStatus.startedAgo
        id = buildStatus.buildID
        switch buildStatus.statusIndicator {
        case .inProgress:
            icon = .inProgress
        case .failure:
            icon = .failure
        case .success:
            icon = .success
        }
    }
    
    init(_ build: RepositoryBuild) {

        title = build.build

        switch build.status {
        case "idle":
            subtitle = ""
            icon = .none
            value = nil
        case "active":
            subtitle = ""
            icon = .inProgress
            value = nil
        case "scheduled":
            subtitle = build.message
            icon = .none
            value = nil
        default:
            subtitle = ""
            icon = .none
            value = nil
        }
        id = build.buildID ?? build.build
    }
}

extension BuildStatus: StandardCellModelable {

    func toStandardCellViewModel() -> StandardCellViewModel {
        return StandardCellViewModel(self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

extension RepositoryBuild: StandardCellModelable {
    
    func toStandardCellViewModel() -> StandardCellViewModel {
        return StandardCellViewModel(self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

extension TaskStatus: StandardCellModelable {

    func toStandardCellViewModel() -> StandardCellViewModel {
        return StandardCellViewModel(self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

extension Repository: StandardCellModelable {

    func toStandardCellViewModel() -> StandardCellViewModel {
        return StandardCellViewModel(self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

extension QueueSummary: StandardCellModelable {

    func toStandardCellViewModel() -> StandardCellViewModel {
        return StandardCellViewModel(self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}
