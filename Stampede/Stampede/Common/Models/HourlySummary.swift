//
//  File.swift
//  
//
//  Created by David House on 5/24/20.
//

import Foundation

public struct HourlySummary: Codable, Identifiable, Equatable {
    public let hour: String
    public let count: Int
    public var id: String {
        return hour
    }
}

#if DEBUG

extension HourlySummary {
    public static let someSummary = HourlySummary(hour: "12", count: 42)
    public static let someSummaries = [
        HourlySummary(hour: "2020-05-24T01:00:00.000Z", count: 12),
        HourlySummary(hour: "2020-05-24T02:00:00.000Z", count: 16),
        HourlySummary(hour: "2020-05-24T03:00:00.000Z", count: 12),
        HourlySummary(hour: "2020-05-24T04:00:00.000Z", count: 8),
        HourlySummary(hour: "2020-05-24T05:00:00.000Z", count: 4),
        HourlySummary(hour: "2020-05-24T06:00:00.000Z", count: 7),
        HourlySummary(hour: "2020-05-24T07:00:00.000Z", count: 4),
        HourlySummary(hour: "2020-05-24T08:00:00.000Z", count: 24),
        HourlySummary(hour: "2020-05-24T09:00:00.000Z", count: 2),
        HourlySummary(hour: "2020-05-24T10:00:00.000Z", count: 12),
        HourlySummary(hour: "2020-05-24T11:00:00.000Z", count: 22),
        HourlySummary(hour: "2020-05-24T12:00:00.000Z", count: 42),
        HourlySummary(hour: "2020-05-24T13:00:00.000Z", count: 12),
        HourlySummary(hour: "2020-05-24T14:00:00.000Z", count: 16),
        HourlySummary(hour: "2020-05-24T15:00:00.000Z", count: 12),
        HourlySummary(hour: "2020-05-24T16:00:00.000Z", count: 8),
        HourlySummary(hour: "2020-05-24T17:00:00.000Z", count: 4),
        HourlySummary(hour: "2020-05-24T18:00:00.000Z", count: 7),
        HourlySummary(hour: "2020-05-24T19:00:00.000Z", count: 4),
        HourlySummary(hour: "2020-05-24T20:00:00.000Z", count: 24),
        HourlySummary(hour: "2020-05-24T21:00:00.000Z", count: 2),
        HourlySummary(hour: "2020-05-24T22:00:00.000Z", count: 12),
        HourlySummary(hour: "2020-05-24T23:00:00.000Z", count: 22),
        HourlySummary(hour: "2020-05-25T00:00:00.000Z", count: 42)
    ]
}

#endif
