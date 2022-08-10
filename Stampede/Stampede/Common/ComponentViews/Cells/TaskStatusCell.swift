//
//  TaskStatusCell.swift
//  Stampede
//
//  Created by David House on 8/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct TaskStatusCell: View {

    let taskStatus: TaskStatus

    var body: some View {
        HStack {
            TaskStatusIcon(status: taskStatus.status, conclusion: taskStatus.conclusion)
            VStack(alignment: .leading) {
                PrimaryLabel(taskStatus.task)
                SecondaryLabel(taskStatus.buildTitle ?? "")
            }
            Spacer()
            ValueLabel(taskStatus.duration)
        }
    }
}

#if DEBUG
struct TaskStatusCell_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<TaskStatus>] {
        [
            PreviewData(id: "completedTask", viewModel: TaskStatus.completedTask),
            PreviewData(id: "failedTask", viewModel: TaskStatus.failedTask),
            PreviewData(id: "inProgressTask", viewModel: TaskStatus.inProgressTask)
        ]
    }

    static func create(from viewModel: TaskStatus) -> some View {
        return TaskStatusCell(taskStatus: viewModel)
    }
}
#endif
