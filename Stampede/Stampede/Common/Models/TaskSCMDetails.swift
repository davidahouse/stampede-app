//
//  TaskSCMDetails.swift
//  Stampede
//
//  Created by David House on 10/17/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

public struct TaskSCMDetails: Codable, Equatable, Hashable {
    let title: String
    let value: String
}

#if DEBUG
extension TaskSCMDetails {
    static let someDetail = TaskSCMDetails(title: "some title", value: "some value")
    static let someDetails = [someDetail]
}
#endif
