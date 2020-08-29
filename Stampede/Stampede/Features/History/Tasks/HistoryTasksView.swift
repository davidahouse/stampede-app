//
//  HistoryTasksView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct HistoryTasksView: View {

    @ObservedObject var viewModel: HistoryTasksViewModel

    init(viewModel: HistoryTasksViewModel, publisher: TaskStatusResponsePublisher? = nil) {
        self.viewModel = viewModel
        self.viewModel.publisher = publisher
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        Image(systemName: "folder.circle")
                            .frame(width: 100)
                        VStack(alignment: .leading) {
                            Text("Task")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let tasks):
            List {
                ForEach(tasks, id: \.self) { item in
                    NavigationLink(destination: BuildTaskFeature(task: item)) {
                        StandardCell(viewModel: item.toStandardCellViewModel())
                    }
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
}

#if DEBUG
struct HistoryTasksView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            HistoryTasksView(viewModel: HistoryTasksViewModel.loading)
            HistoryTasksView(viewModel: HistoryTasksViewModel.networkError)
            HistoryTasksView(viewModel: HistoryTasksViewModel.someTasks)
        }
    }
}
#endif
