//
//  DebugInfo.swift
//  Stampede
//
//  Created by David House on 10/18/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

class DebugInfo: ObservableObject {
    
    var messages: [String] = []

    func logMessage(_ message: String) {
        messages.insert(message, at: 0)
    }
}
