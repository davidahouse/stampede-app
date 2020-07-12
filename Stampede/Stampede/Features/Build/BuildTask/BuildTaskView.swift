//
//  RepositoryBuildTaskView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct BuildTaskView: View {

    @ObservedObject var viewModel: BuildTaskViewModel

    var body: some View {
        List {
            Section(header: Text("Task Information")) {
                HStack {
                    PrimaryLabel("Task")
                    Spacer()
                    PrimaryLabel(viewModel.task.task)
                }

                HStack {
                    PrimaryLabel("Conclusion")
                    Spacer()
                    ValueLabel(viewModel.task.conclusion ?? "")
                }

                HStack {
                    PrimaryLabel("Node")
                    Spacer()
                    ValueLabel(viewModel.task.node ?? "")
                }

                HStack {
                    PrimaryLabel("Duration")
                    Spacer()
                    ValueLabel(viewModel.task.duration)
                }
            }
            Section(header: Text("Task Config")) {
                Text("Hello")
            }
            Section(header: Text("Task Results")) {
                Text("Hello")
            }
            Section(header: Text("Artifacts")) {
                Text("Hello")
            }
            Section(header: Text("Summary")) {
                Text("Hello")
            }
            Section(header: Text("Text")) {
                Text("Hello")
            }
        }
    }
}

#if DEBUG
struct BuildTaskView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            BuildTaskView(viewModel: BuildTaskViewModel(task: TaskStatus.completedTask))
        }
    }
}
#endif
