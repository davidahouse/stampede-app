//
//  Fixtures+Date.swift
//  Stampede
//
//  Created by David House on 11/2/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

#if DEBUG
extension Date {

    static var fixtureDate: Date {
        Date(timeIntervalSinceReferenceDate: 0)
    }

    static var twelveSecondsAgo: Date {
        Date(timeIntervalSinceReferenceDate: -12)
    }

    static var aMinuteAgo: Date {
        Date(timeIntervalSinceReferenceDate: -12*60)
    }

    static var anHourAgo: Date {
        Date(timeIntervalSinceReferenceDate: -12*60*60)
    }
}
#endif
