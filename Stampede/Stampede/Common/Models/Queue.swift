//
//  Queue.swift
//  Stampede-Mobile
//
//  Created by David House on 10/20/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public struct Queue: Codable, Identifiable, Equatable {
    public let id: String
    public let title: String
}

#if DEBUG

extension Queue {
    public static let someQueue = Queue(id: "ios-tasks", title: "iOS Tasks")
    public static let someOtherQueue = Queue(id: "android-tasks", title: "Android Tasks")
    public static let someQueues = [Queue.someQueue,
                             Queue.someOtherQueue]
}

#endif
