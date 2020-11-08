//
//  MonitorActiveTasksView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveTasksView: View {

    // MARK: - View Model
    
    @EnvironmentObject var viewModel: MonitorActiveTasksViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var routes: Routes

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { tasks in
            List {
                if tasks.count > 0 {
                    ForEach(tasks, id: \.self) { item in
                        Button(action: {
                            router.route(to: routes.routeForTask(item.task_id))
                        }, label: {
                            TaskStatusCell(taskStatus: item)
                        })
                    }
                } else {
                    Text("No active tasks found")
                }
            }
            .listStyle(DefaultListStyle())
        })
    }
}

#if DEBUG
struct MonitorActiveTasksView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        devicePreviews
    }

    static var defaultViewModel: PreviewData<MonitorActiveTasksViewModel> {
        PreviewData(id: "someBuilds", viewModel: MonitorActiveTasksViewModel.someTasks)
    }

    static var alternateViewModels: [PreviewData<MonitorActiveTasksViewModel>] {
        [
            PreviewData(id: "loading", viewModel: MonitorActiveTasksViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: MonitorActiveTasksViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: MonitorActiveTasksViewModel) -> some View {
        return MonitorActiveTasksView().environmentObject(viewModel)
    }
}
#endif
