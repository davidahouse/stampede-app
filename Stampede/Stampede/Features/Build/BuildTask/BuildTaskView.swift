//
//  RepositoryBuildTaskView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct BuildTaskView: View {

    @EnvironmentObject var viewModel: BuildTaskViewModel

    var body: some View {
        BaseView(viewModel: viewModel, content: { taskDetails in
            List {
                Section(header: Text("Task Information")) {
                    HStack {
                        PrimaryLabel("Task")
                        Spacer()
                        PrimaryLabel(taskDetails.task.task)
                    }

                    HStack {
                        PrimaryLabel("Conclusion")
                        Spacer()
                        ValueLabel(taskDetails.task.conclusion ?? "")
                    }

                    HStack {
                        PrimaryLabel("Node")
                        Spacer()
                        ValueLabel(taskDetails.task.node ?? "")
                    }

                    HStack {
                        PrimaryLabel("Duration")
                        Spacer()
                        ValueLabel(taskDetails.task.duration)
                    }

                    ForEach(taskDetails.scmDetails, id: \.self) { detail in
                        HStack {
                            PrimaryLabel(detail.title)
                            Spacer()
                            ValueLabel(detail.value)
                        }
                    }
                }
                if taskDetails.artifacts.count > 0 {
                    Section(header: Text("Artifacts")) {
                        ForEach(taskDetails.artifacts, id: \.self) { artifact in
                            HStack {
                                PrimaryLabel(artifact.title)
                                Spacer()
                                ValueLabel(artifact.type)
                            }
                        }
                    }
                }
                Section(header: Text("Summary")) {
                    Text(taskDetails.summary)
                }
                if taskDetails.text != "" {
                    Section(header: Text("Text")) {
                        Text(taskDetails.text)
                    }
                }
            }
        })
    }
}

#if DEBUG
struct BuildTaskView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            BuildTaskView().environmentObject(BuildTaskViewModel(state: .results(TaskDetails.someTaskDetails)))
        }
    }
}
#endif
