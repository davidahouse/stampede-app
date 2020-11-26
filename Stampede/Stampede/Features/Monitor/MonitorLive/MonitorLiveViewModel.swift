//
//  MonitorLiveViewModel.swift
//  Stampede
//
//  Created by David House on 6/3/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine
import HouseKit

class MonitorLiveViewModel: ObservableObject {

    // MARK: - Published properties
    @Published var queueDepths: [Int] = []
    @Published var gaugeInfo: QueueGaugeInfo

    // MARK: - Initializer
    init(activeWorkers: Int = 0, busyWorkers: Int = 0, queueDepths: [Int] = []) {
        self.queueDepths = queueDepths
        gaugeInfo = QueueGaugeInfo(title: "\(activeWorkers) Workers", idle: activeWorkers - busyWorkers, active: busyWorkers)
    }

    // MARK: - Private properties
    private var disposables = Set<AnyCancellable>()

    private var workers: [WorkerStatus] = [] {
        didSet {
            self.recalculateWorkers()
        }
    }

    private var queues: QueueSummaries = QueueSummaries(taskQueues: [], systemQueues: []) {
        didSet {
            self.recalculateQueueDepth()
        }
    }

    private var refreshTimer: Timer?

    // MARK: - Properties

    var workersPublisher: AnyPublisher<[WorkerStatus], ServiceError>?
    var queuesPublisher: AnyPublisher<QueueSummaries, ServiceError>?

    func startMonitoring() {
        fetch()
        refreshTimer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { [weak self] _ in
                         self?.fetch()
                     })
    }

    func stopMonitoring() {
        refreshTimer?.invalidate()
    }

    private func fetch() {
        self.workersPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.workers = []
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                if value.count > 0 {
                    self.workers = value
                } else {
                    self.workers = []
                }
            }
        }).store(in: &self.disposables)

        self.queuesPublisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.queues = QueueSummaries(taskQueues: [], systemQueues: [])
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.queues = value
            }
        }).store(in: &self.disposables)
    }

    private func recalculateQueueDepth() {

        var queuedCount = 0
        for queue in queues.taskQueues {
            queuedCount += queue.stats.waiting
        }
        for queue in queues.systemQueues {
            queuedCount += queue.stats.waiting
        }
        queueDepths.append(queuedCount)
        if queueDepths.count > 50 {
            queueDepths.remove(at: 0)
        }
    }

    private func recalculateWorkers() {

        var activeWorkers = 0
        var busyWorkers = 0
        for worker in workers {
            activeWorkers += 1
            if worker.status == "busy" {
                busyWorkers += 1
            }
        }
        self.gaugeInfo = QueueGaugeInfo(title: "\(activeWorkers) Workers", idle: activeWorkers - busyWorkers, active: busyWorkers)
    }
}

#if DEBUG
extension MonitorLiveViewModel {
    static var someViewModel = MonitorLiveViewModel(activeWorkers: 12, busyWorkers: 4, queueDepths: [4, 4, 6, 7, 1, 2, 0, 0, 2, 4])
}
#endif
