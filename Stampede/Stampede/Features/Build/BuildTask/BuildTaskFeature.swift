//
//  RepositoryBuildTaskFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct BuildTaskFeature: View {

    let task: TaskStatus

    var body: some View {
        BuildTaskView(viewModel: BuildTaskViewModel(task: task))
            .navigationBarTitle(task.task)
    }
}

#if DEBUG
struct BuildTaskFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            BuildTaskFeature(task: TaskStatus.completedTask)
        }
    }
}
#endif
