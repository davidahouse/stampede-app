//
//  Date+Extension.swift
//  Stampede
//
//  Created by David House on 10/6/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

extension Date {

    func ago() -> String {
        let interval = Date().timeIntervalSince(self)
        if interval < 60 {
            return "\(Int(round(interval))) sec(s) ago"
        } else if interval < 3600 {
            return "\(Int(round(interval / 60))) min(s) ago"
        } else if interval < 216000 {
            return "\(Int(round(interval / 3600))) hour(s) ago"
        } else {
            return "\(Int(round(interval / 216000))) day(s) ago"
        }
    }
}
