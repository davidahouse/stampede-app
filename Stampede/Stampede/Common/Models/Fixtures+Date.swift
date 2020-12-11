//
//  Fixtures+Date.swift
//  Stampede
//
//  Created by David House on 11/2/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

#if DEBUG
extension Calendar {

    static var fixtureCalendar: Calendar {
        return Calendar.current
    }
}

extension Date {

    static var fixtureDate: Date {
        Calendar.fixtureCalendar.startOfDay(for: Date()).addingTimeInterval(5*60*60)
    }

    static var twelveSecondsAgo: Date {
        Date.fixtureDate.addingTimeInterval(-12)
    }

    static var aMinuteAgo: Date {
        Date.fixtureDate.addingTimeInterval(-12*60)
    }

    static var anHourAgo: Date {
        Date.fixtureDate.addingTimeInterval(-12*60*60)
    }
}
#endif
