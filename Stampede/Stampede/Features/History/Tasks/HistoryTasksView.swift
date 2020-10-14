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
    
    @EnvironmentObject var viewModel: HistoryTasksViewModel
    @EnvironmentObject var router: Router

    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { tasks in
            List {
                ForEach(tasks, id: \.self) { item in
                    Button(action: {
                        router.route(to: .taskDetails(item))
                    }, label: {
                        TaskStatusCell(taskStatus: item)
                    })
                }
            }
            .listStyle(DefaultListStyle())
        })
    }
}

#if DEBUG
struct HistoryTasksView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            HistoryTasksView().environmentObject(HistoryTasksViewModel.loading)
            HistoryTasksView().environmentObject(HistoryTasksViewModel.networkError)
            HistoryTasksView().environmentObject(HistoryTasksViewModel.someTasks)
        }
    }
}
#endif
