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
    
    @ObservedObject var viewModel: MonitorActiveTasksViewModel

    // MARK: - Properties
    
    weak var router: Router?
    
    // MARK: - Initializer
    
    init(viewModel: MonitorActiveTasksViewModel, router: Router? = nil) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - Body
    
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
                if tasks.count > 0 {
                    ForEach(tasks, id: \.self) { item in
                        Button(action: {
                            router?.route(to: .taskDetails(item))
                        }, label: {
                            TaskStatusCell(taskStatus: item)
                        })
                    }
                } else {
                    Text("No active tasks found")
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
}

#if DEBUG
struct MonitorActiveTasksView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorActiveTasksView(viewModel: MonitorActiveTasksViewModel.loading)
            MonitorActiveTasksView(viewModel: MonitorActiveTasksViewModel.networkError)
            MonitorActiveTasksView(viewModel: MonitorActiveTasksViewModel.someTasks)
        }
    }
}
#endif
