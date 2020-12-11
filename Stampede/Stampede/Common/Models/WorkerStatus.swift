//
//  WorkerStatus.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public struct WorkerStatus: Codable, Identifiable, Equatable {
    public let timestamp: Date
    public let node: String
    public let version: String
    public let workerName: String
    public let status: String
    public let taskQueue: String

    public var id: String {
        return node + workerName
    }
}

#if DEBUG

extension WorkerStatus {
    public static let someWorker = WorkerStatus(timestamp: Date.fixtureDate, node: "some node", version: "1.1.0", workerName: "some worker", status: "idle", taskQueue: "someQueue")
    public static let someOtherWorker = WorkerStatus(timestamp: Date.fixtureDate, node: "some node", version: "1.1.0", workerName: "some other worker", status: "idle", taskQueue: "someQueue")
    public static let someThirdWorker = WorkerStatus(timestamp: Date.fixtureDate, node: "some node", version: "1.1.0", workerName: "some third worker", status: "idle", taskQueue: "someQueue")
    public static let workerStatuses = [someWorker, someOtherWorker, someThirdWorker]
}

#endif
