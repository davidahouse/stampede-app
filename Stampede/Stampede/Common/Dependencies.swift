//
//  Dependencies.swift
//  Stampede
//
//  Created by David House on 10/10/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

class Dependencies {
    let repositoryList: RepositoryList
    let theme: CurrentTheme

    init() {
        repositoryList = RepositoryList()
        theme = CurrentTheme()
    }
}
