//
//  MonitorActiveTasksView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveTasksView: View {

    // MARK: - Environment

    // MARK: - ViewModel


    // MARK: - View

    let tasks = TaskStatus.recentTasks

    var body: some View {
        List {
            ForEach(tasks, id: \.self) { item in
                NavigationLink(destination: BuildTaskFeature(task: item)) {
                    StandardCell(viewModel: item.toStandardCellViewModel())
                }
            }
        }
    }
}

#if DEBUG
struct MonitorActiveTasksView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorActiveTasksView()
            MonitorActiveTasksView()
        }
    }
}
#endif
