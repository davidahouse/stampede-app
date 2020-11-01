//
//  TaskStatusCell.swift
//  Stampede
//
//  Created by David House on 8/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct TaskStatusCell: View {

    @EnvironmentObject var router: Router
    
    let taskStatus: TaskStatus

    var body: some View {
        Button(action: {
            router.route(to: BuildTaskRoute(taskID: taskStatus.task_id))
        }, label: {
            HStack {
                switch taskStatus.status {
                case "inProgress":
                    CurrentTheme.Icons.inProgress.image().font(Font.system(size: 32, weight: .regular))
                default:
                    switch taskStatus.conclusion {
                    case "success":
                        CurrentTheme.Icons.success.image().font(Font.system(size: 32, weight: .regular))
                    default:
                        CurrentTheme.Icons.failure.image().font(Font.system(size: 32, weight: .regular))
                    }
                }
                VStack(alignment: .leading) {
                    PrimaryLabel(taskStatus.task)
                    SecondaryLabel(taskStatus.buildTitle ?? "")
                }
                Spacer()
                ValueLabel(taskStatus.duration)
                Image(systemName: "chevron.right")
            }
        })
    }
}

#if DEBUG
struct TaskStatusCell_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        debugPreviews
    }

    static var defaultViewModel: PreviewData<TaskStatus> {
        PreviewData(id: "completedTask", viewModel: TaskStatus.completedTask)
    }

    static var alternateViewModels: [PreviewData<TaskStatus>] {
        [PreviewData(id: "failedTask", viewModel: TaskStatus.failedTask)]
    }

    static func create(from viewModel: TaskStatus) -> some View {
        return TaskStatusCell(taskStatus: viewModel)
    }
}
#endif
