//
//  TaskStatusIcon.swift
//  Stampede
//
//  Created by David House on 2/20/21.
//  Copyright © 2021 David House. All rights reserved.
//

import SwiftUI

struct TaskStatusIcon: View {
    
    let status: String
    let conclusion: String?
    
    var body: some View {
        switch status {
        case "in_progress":
            CurrentTheme.Icons.inProgress.image().font(Font.system(size: 32, weight: .regular))
        default:
            switch conclusion {
            case "success":
                CurrentTheme.Icons.success.image().font(Font.system(size: 32, weight: .regular))
            default:
                CurrentTheme.Icons.failure.image().font(Font.system(size: 32, weight: .regular))
            }
        }
    }
}

#if DEBUG
struct TaskStatusIcon_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        debugPreviews
    }

    static var defaultViewModel: PreviewData<(String, String?)> {
        PreviewData(id: "inprogress", viewModel: ("in_progress", nil))
    }

    static var alternateViewModels: [PreviewData<(String, String?)>] {
        [
            PreviewData(id: "inprogress", viewModel: ("in_progress", nil)),
            PreviewData(id: "success", viewModel: ("success", "success")),
            PreviewData(id: "failure", viewModel: ("completed", "failure"))
        ]
    }

    static func create(from viewModel: (String, String?)) -> some View {
        TaskStatusIcon(status: viewModel.0, conclusion: viewModel.1)
    }
}
#endif
