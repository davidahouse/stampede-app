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
                BuildTaskInformationView(taskStatus: taskDetails.task)
                BuildTaskSCMDetailsView(scmDetails: taskDetails.scmDetails)

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
                    MarkdownContentView(markdown: taskDetails.summary)
                }
                if taskDetails.text != "" {
                    Section(header: Text("Text")) {
                        MarkdownContentView(markdown: taskDetails.text)
                    }
                }
            }
        })
    }
}

struct BuildTaskInformationView: View {

    let taskStatus: TaskStatus

    var body: some View {
        Section(header: Text("Task Information")) {
            HStack {
                PrimaryLabel("Task")
                Spacer()
                PrimaryLabel(taskStatus.task)
            }

            HStack {
                PrimaryLabel("Conclusion")
                Spacer()
                ValueLabel(taskStatus.conclusion ?? "")
            }

            HStack {
                PrimaryLabel("Node")
                Spacer()
                ValueLabel(taskStatus.node ?? "")
            }

            if let startedAt = taskStatus.started_at {
                HStack {
                    PrimaryLabel("Start Time")
                    Spacer()
                    Text(startedAt, style: .time)
                }
            }

            if let finishedAt = taskStatus.finished_at {
                HStack {
                    PrimaryLabel("Finish Time")
                    Spacer()
                    Text(finishedAt, style: .time)
                }
            }

            HStack {
                PrimaryLabel("Duration")
                Spacer()
                ValueLabel(taskStatus.duration)
            }
        }
    }
}

struct BuildTaskSCMDetailsView: View {

    let scmDetails: [TaskSCMDetails]

    var body: some View {
        Section(header: Text("SCM Information")) {
            ForEach(scmDetails, id: \.self) { detail in
                HStack {
                    PrimaryLabel(detail.title)
                    Spacer()
                    ValueLabel(detail.value)
                }
            }
        }
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
