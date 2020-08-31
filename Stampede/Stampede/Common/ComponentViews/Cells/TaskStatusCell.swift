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
        }
    }
}

#if DEBUG
struct TaskStatusCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            TaskStatusCell(taskStatus: TaskStatus.completedTask)
        }
    }
}
#endif
