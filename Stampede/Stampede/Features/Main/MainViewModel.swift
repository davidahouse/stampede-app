//
//  MainViewModel.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import HouseKit

class MainViewModel: ObservableObject {

    @Published var repositories: [Repository]

    init(repositories: [Repository] = []) {
        self.repositories = repositories
    }
}
