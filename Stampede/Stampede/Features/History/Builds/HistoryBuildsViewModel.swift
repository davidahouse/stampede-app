//
//  HistoryBuildsViewModel.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

class HistoryBuildsViewModel: BaseViewModel, ObservableObject {
    @Published var builds: [BuildStatus]
    
    init(builds: [BuildStatus] = []) {
        self.builds = builds
    }
}
