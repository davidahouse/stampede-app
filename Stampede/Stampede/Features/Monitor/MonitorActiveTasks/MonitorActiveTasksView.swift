//
//  MonitorActiveTasksView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/6/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveTasksView: View {

    // MARK: - Environment

    // MARK: - ViewModel


    // MARK: - View

    var body: some View {
        Text("hello")
//        StandardList(viewModel.state)
//        .navigationBarTitle("Active Tasks")
    }
}

#if DEBUG
struct MonitorActiveTasksView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorActiveTasksView()
            MonitorActiveTasksView()
        }
    }
}
#endif
