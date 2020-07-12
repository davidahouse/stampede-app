//
//  ConfigOverrides.swift
//  Stampede-Mobile
//
//  Created by David House on 10/20/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public struct ConfigOverrides: Codable, Equatable {
    public let overrides: [String: String]
}

#if DEBUG

extension ConfigOverrides {
    public static let someOverrides = ConfigOverrides(overrides: [
        "someHost": "http://localhost",
        "someAPIKey": "1234567890"
    ])
}

#endif
