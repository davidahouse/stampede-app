//
//  HistoryTasksView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct HistoryTasksView: View {

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

struct HistoryTasksView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            HistoryTasksView()
        }
    }
}
