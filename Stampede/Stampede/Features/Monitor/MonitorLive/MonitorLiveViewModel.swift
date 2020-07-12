//
//  MonitorLiveViewModel.swift
//  Stampede
//
//  Created by David House on 6/3/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine

struct MonitorLiveViewModelQueue: Hashable {
    let title: String
    let gauge: QueueGaugeInfo
    let history: [QueueGaugeInfo]
}

class MonitorLiveViewModel: BaseViewModel, ObservableObject {

    // MARK: - Published properties
    @Published var queueGauges: [MonitorLiveViewModelQueue]

    private var workers: [WorkerStatus] = [] {
        didSet {
            self.recalculate()
        }
    }

    private var queues: [QueueSummary] = [] {
        didSet {
            self.recalculate()
        }
    }

    // MARK: - Properties

    var workersPublisher: AnyPublisher<[WorkerStatus], StampedeError>? {
        didSet {
            self.fetch()
        }
    }

    var queuesPublisher: AnyPublisher<[QueueSummary], StampedeError>? {
        didSet {
            self.fetch()
        }
    }

    // MARK: - Initializer
    init(gauges: [MonitorLiveViewModelQueue]? = nil) {
        if let gauges = gauges {
            self.queueGauges = gauges
        } else {
            self.queueGauges = []
        }
        super.init(shouldRefresh: true)
    }

    override func fetch() {
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
                self.queues = []
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                if value.count > 0 {
                    self.queues = value
                } else {
                    self.queues = []
                }
            }
        }).store(in: &self.disposables)
    }

    private func recalculate() {
        var updatedQueues: [MonitorLiveViewModelQueue] = []

        for queue in queues {
            let activeCount = workers.filter({ $0.taskQueue == queue.queue && $0.status == "busy" }).count
            let inactiveCount = workers.filter({ $0.taskQueue == queue.queue && $0.status == "idle" }).count
            let info = QueueGaugeInfo(title: queue.queue, idle: inactiveCount, active: activeCount, queued: queue.stats.waiting)
            if info.idle > 0 || info.active > 0 || info.queued > 0 {
                if let existing = queueGauges.filter({ $0.title == queue.queue }).first {
                    var existingHistory = existing.history
                    existingHistory.append(info)
                    if existingHistory.count > 50 {
                        existingHistory.remove(at: 0)
                    }
                    updatedQueues.append(MonitorLiveViewModelQueue(title: queue.queue, gauge: info, history: existingHistory))
                } else {
                    updatedQueues.append(MonitorLiveViewModelQueue(title: queue.queue, gauge: info, history: [info]))
                }
            }
        }

        queueGauges = updatedQueues
    }
}

#if DEBUG
extension MonitorLiveViewModel {
    static var idleQueue: QueueGaugeInfo = QueueGaugeInfo(title: "idleQueue", idle: 8, active: 0, queued: 0)
    static var partialQueue: QueueGaugeInfo = QueueGaugeInfo(title: "partialQueue", idle: 4, active: 4, queued: 0)
    static var fullQueue: QueueGaugeInfo = QueueGaugeInfo(title: "fullQueue", idle: 0, active: 8, queued: 0)
    static var queuedQueue: QueueGaugeInfo = QueueGaugeInfo(title: "queuedQueue", idle: 0, active: 8, queued: 6)

    static var oneIdleQueue = MonitorLiveViewModel(gauges: [
        MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.idleQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue
        ])
    ])

    static var onePartialQueue = MonitorLiveViewModel(gauges: [
        MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.partialQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue
        ])
    ])

    static var oneFullQueue = MonitorLiveViewModel(gauges: [
        MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.fullQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.fullQueue,
            MonitorLiveViewModel.fullQueue,
            MonitorLiveViewModel.fullQueue
        ])
    ])

    static var oneQueuedQueue = MonitorLiveViewModel(gauges: [
        MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.queuedQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.queuedQueue,
            MonitorLiveViewModel.queuedQueue
        ])
    ])

    static var twoQueues = MonitorLiveViewModel(gauges: [
        MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.queuedQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.queuedQueue,
            MonitorLiveViewModel.queuedQueue
        ]),
        MonitorLiveViewModelQueue(title: "otherQueue", gauge: MonitorLiveViewModel.fullQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.fullQueue,
            MonitorLiveViewModel.fullQueue,
            MonitorLiveViewModel.fullQueue
        ])
    ])
    
    static var allQueues = MonitorLiveViewModel(gauges: [
        MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.queuedQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.queuedQueue,
            MonitorLiveViewModel.queuedQueue
        ]),
        MonitorLiveViewModelQueue(title: "otherQueue", gauge: MonitorLiveViewModel.fullQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.fullQueue,
            MonitorLiveViewModel.fullQueue,
            MonitorLiveViewModel.fullQueue
        ]),
        MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.idleQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue
        ]),
        MonitorLiveViewModelQueue(title: "someQueue", gauge: MonitorLiveViewModel.partialQueue, history: [
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.idleQueue,
            MonitorLiveViewModel.partialQueue,
            MonitorLiveViewModel.partialQueue
        ])
    ])
}
#endif
