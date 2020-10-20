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

    var multilineValue: Bool {
        if title.contains("Commit") {
            return true
        } else {
            return false
        }
    }

    var displayValue: String {
        if title.contains("SHA") {
            return String(value.prefix(7))
        } else {
            return value
        }
    }
}

#if DEBUG
extension TaskSCMDetails {
    static let someDetail = TaskSCMDetails(title: "some title", value: "some value")
    static let someDetails = [someDetail]
}
#endif
