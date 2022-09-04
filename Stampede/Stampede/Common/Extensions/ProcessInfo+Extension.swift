//
//  ProcessInfo+Extension.swift
//  Stampede
//
//  Created by David House on 9/3/22.
//  Copyright © 2022 David House. All rights reserved.
//

import Foundation

extension ProcessInfo {
    
    static func areTestsRunning() -> Bool {
        return NSClassFromString("XCTest") != nil
    }

    static func arePreviewsRunning() -> Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil
    }
    
    static func isStampedeServerInEnvironment() -> Bool {
        return ProcessInfo.processInfo.environment["StampedeServer"] != nil
    }
    
    static func isPersonaInEnvironment() -> Bool {
        return ProcessInfo.processInfo.environment["Persona"] != nil
    }
}
