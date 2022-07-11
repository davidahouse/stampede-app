//
//  SettingsDeveloperPersonaViewModel.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

class SettingsDeveloperPersonaViewModel: ObservableObject {

    @Published var personas: [String] = [
        "None",
        "Happy",
        "Error",
        "Loading",
        "ErrorBuildDetails"
    ]
}
