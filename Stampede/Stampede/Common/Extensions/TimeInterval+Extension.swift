//
//  TimeInterval+Extension.swift
//  Stampede
//
//  Created by David House on 10/6/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

extension TimeInterval {

    func duration() -> String {
        let seconds: TimeInterval = self
        if seconds < 60 {
            return String.localizedStringWithFormat("%.0f sec(s)", seconds)
        } else if seconds < 3600 {
            return String.localizedStringWithFormat("%.0f min(s)", seconds / 60)
        } else if seconds < 216000 {
            return String.localizedStringWithFormat("%.0f hour(s)", seconds / 3600)
        } else {
            return String.localizedStringWithFormat("%.0f day(s)", seconds / 216000)
        }
    }
}
