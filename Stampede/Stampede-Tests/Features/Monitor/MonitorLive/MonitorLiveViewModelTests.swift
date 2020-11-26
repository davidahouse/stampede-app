//
//  MonitorLiveViewModelTests.swift
//  Stampede-Tests
//
//  Created by David House on 10/23/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
import Combine
import HouseKit
@testable import Stampede

class MonitorLiveViewModelTests: XCTestCase {

    let viewModel = MonitorLiveViewModel()

    func testThatReceivingWorkersUpdatesTheGaugeInfo() {
        let result: [WorkerStatus] = [
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker", status: "busy", taskQueue: "someQueue"),
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker2", status: "busy", taskQueue: "someQueue"),
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker3", status: "idle", taskQueue: "someQueue")
        ]
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.workersPublisher = 
            AnyPublisher<[WorkerStatus], ServiceError>(Future<[WorkerStatus], ServiceError> { promise in promise(.success(result))})
        viewModel.startMonitoring()
        let cancellable = viewModel.$gaugeInfo.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.active == 2 && value.idle == 1 {
                expectation.fulfill()
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
        viewModel.stopMonitoring()
    }

    func testThatReceivingNoWorkersClearsTheGaugeInfo() {
        let result: [WorkerStatus] = [
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker", status: "busy", taskQueue: "someQueue"),
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker2", status: "busy", taskQueue: "someQueue"),
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker3", status: "idle", taskQueue: "someQueue")
        ]
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.workersPublisher =
            AnyPublisher<[WorkerStatus], ServiceError>(Future<[WorkerStatus], ServiceError> { promise in promise(.success(result))})
        viewModel.startMonitoring()
        let cancellable = viewModel.$gaugeInfo.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.active == 2 && value.idle == 1 {
                expectation.fulfill()
            }
        })

        wait(for: [expectation], timeout: 10.0)
        viewModel.stopMonitoring()
        cancellable.cancel()

        let nextExpectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.workersPublisher =
            AnyPublisher<[WorkerStatus], ServiceError>(Future<[WorkerStatus], ServiceError> { promise in promise(.success([]))})
        viewModel.startMonitoring()
        let nextCancellable = viewModel.$gaugeInfo.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.active == 0 && value.idle == 0 {
                nextExpectation.fulfill()
            }
        })

        wait(for: [nextExpectation], timeout: 10.0)
        nextCancellable.cancel()
        viewModel.stopMonitoring()
    }

    func testThatReceivingANetworkErrorClearsTheGaugeInfo() {
        let result: [WorkerStatus] = [
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker", status: "busy", taskQueue: "someQueue"),
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker2", status: "busy", taskQueue: "someQueue"),
            WorkerStatus(timestamp: Date(), node: "someNode", version: "someVersion", workerName: "someWorker3", status: "idle", taskQueue: "someQueue")
        ]
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.workersPublisher =
            AnyPublisher<[WorkerStatus], ServiceError>(Future<[WorkerStatus], ServiceError> { promise in promise(.success(result))})
        viewModel.startMonitoring()
        let cancellable = viewModel.$gaugeInfo.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.active == 2 && value.idle == 1 {
                expectation.fulfill()
            }
        })

        wait(for: [expectation], timeout: 10.0)
        viewModel.stopMonitoring()
        cancellable.cancel()

        let nextExpectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.workersPublisher =
            AnyPublisher<[WorkerStatus], ServiceError>(Future<[WorkerStatus], ServiceError> { promise in promise(.failure(.network(description: "some network error")))})
        viewModel.startMonitoring()
        let nextCancellable = viewModel.$gaugeInfo.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.active == 0 && value.idle == 0 {
                nextExpectation.fulfill()
            }
        })

        wait(for: [nextExpectation], timeout: 10.0)
        nextCancellable.cancel()
        viewModel.stopMonitoring()
    }

    func testThatReceivingQueuesUpdatesTheQueueDepths() {
        let result: QueueSummaries = QueueSummaries(taskQueues: [
            QueueSummary(queue: "someQueue", stats: QueueSummaryStats(waiting: 12, active: 0, completed: 0, failed: 0, delayed: 0, paused: 0))
        ], systemQueues: [])
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.queuesPublisher =
            AnyPublisher<QueueSummaries, ServiceError>(Future<QueueSummaries, ServiceError> { promise in promise(.success(result))})
        viewModel.startMonitoring()
        let cancellable = viewModel.$queueDepths.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.count == 1 {
                if let first = value.first, first == 12 {
                    expectation.fulfill()
                }
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
        viewModel.stopMonitoring()
    }

    func testThatReceivingAnErrorDoesNotModifyTheDepthList() {
        let result: QueueSummaries = QueueSummaries(taskQueues: [
            QueueSummary(queue: "someQueue", stats: QueueSummaryStats(waiting: 12, active: 0, completed: 0, failed: 0, delayed: 0, paused: 0))
        ], systemQueues: [])
        let expectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.queuesPublisher =
            AnyPublisher<QueueSummaries, ServiceError>(Future<QueueSummaries, ServiceError> { promise in promise(.success(result))})
        viewModel.startMonitoring()
        let cancellable = viewModel.$queueDepths.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.count == 1 {
                if let first = value.first, first == 12 {
                    expectation.fulfill()
                }
            }
        })

        wait(for: [expectation], timeout: 10.0)
        cancellable.cancel()
        viewModel.stopMonitoring()

        let nextExpectation = XCTestExpectation(description: "waiting on publisher")
        viewModel.queuesPublisher =
            AnyPublisher<QueueSummaries, ServiceError>(Future<QueueSummaries, ServiceError> { promise in promise(.failure(.network(description: "some network error")))})
        viewModel.startMonitoring()
        let nextCancellable = viewModel.$queueDepths.sink(receiveCompletion: { _ in
            print("received completion")
        }, receiveValue: { value in
            if value.count == 1 {
                nextExpectation.fulfill()
            }
        })

        wait(for: [nextExpectation], timeout: 10.0)
        nextCancellable.cancel()
        viewModel.stopMonitoring()
    }
}
