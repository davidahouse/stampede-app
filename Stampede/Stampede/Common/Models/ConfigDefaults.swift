//
//  ConfigDefaults.swift
//  Stampede-Mobile
//
//  Created by David House on 10/20/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

public struct ConfigDefaults: Codable {
    public let defaults: [String: String]
}

#if DEBUG

extension ConfigDefaults {
    public static let someDefaults = ConfigDefaults(defaults: [
        "someHost": "http://localhost",
        "someAPIKey": "1234567890"
    ])
}

#endif
