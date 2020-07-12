//
//  RepositoryBuildTaskViewModel.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation

class BuildTaskViewModel: ObservableObject {

    @Published var task: TaskStatus

    init(task: TaskStatus) {
        self.task = task
    }
}
