//
//  SettingsInfoViewModel.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class SettingsInfoViewModel: ObservableObject {

    @Published var appVersion: String
    @Published var appBuildNumber: String

    init() {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            appVersion = version
        } else {
            appVersion = ""
        }
        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            appBuildNumber = build
        } else {
            appBuildNumber = ""
        }
    }
}
