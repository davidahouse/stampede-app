//
//  HistoryTasksView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct HistoryTasksView: View {

    // MARK: - View Model
    
    @StateObject var viewModel = HistoryTasksViewModel()
    @EnvironmentObject var service: StampedeService

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { tasks in
            List {
                if tasks.count > 0 {
                    ForEach(tasks, id: \.self) { item in
                        NavigationLink(value: item) {
                            TaskStatusCell(taskStatus: item)
                        }
                    }
                } else {
                    PrimaryLabel("No tasks found")
                }
            }
            .listStyle(DefaultListStyle())
        })
        .navigationTitle("Task History")
        .task {
            await viewModel.fetch(service: service)
        }
    }
}

#if DEBUG
struct HistoryTasksView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        devicePreviews
    }

    static var defaultViewModel: PreviewData<HistoryTasksViewModel> {
        PreviewData(id: "someTasks", viewModel: HistoryTasksViewModel.someTasks)
    }

    static var alternateViewModels: [PreviewData<HistoryTasksViewModel>] {
        [
            PreviewData(id: "loading", viewModel: HistoryTasksViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: HistoryTasksViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: HistoryTasksViewModel) -> some View {
        return HistoryTasksView().environmentObject(viewModel)
    }
}
#endif
