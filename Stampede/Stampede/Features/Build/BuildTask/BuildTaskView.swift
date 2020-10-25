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
    @EnvironmentObject var router: Router

    var body: some View {
        BaseView(viewModel: viewModel, content: { taskDetails in
            List {
                BuildTaskInformationView(taskStatus: taskDetails.task)
                BuildTaskSCMDetailsView(scmDetails: taskDetails.scmDetails)
                if taskDetails.artifacts.count > 0 {
                    BuildTaskArtifactsView(taskID: taskDetails.task.task_id, artifacts: taskDetails.artifacts)
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
                if detail.multilineValue {
                    VStack(alignment: .leading) {
                        PrimaryLabel(detail.title)
                        ValueLabel(detail.displayValue)
                    }
                } else {
                    HStack {
                        PrimaryLabel(detail.title)
                        Spacer()
                        ValueLabel(detail.displayValue)
                    }
                }
            }
        }
    }
}

struct BuildTaskArtifactsView: View {

    let taskID: String
    let artifacts: [TaskArtifact]

    @EnvironmentObject var router: Router

    var body: some View {
        Section(header: Text("Artifacts")) {
            ForEach(artifacts, id: \.self) { artifact in
                if artifact.type == "cloc" {
                    Button(action: {
                        router.route(to: .artifactCloc(taskID: taskID, title: artifact.title))
                    }, label: {
                        HStack {
                            PrimaryLabel(artifact.title)
                            Spacer()
                            ValueLabel(artifact.type)
                            Image(systemName: "chevron.right")
                        }
                    })
                } else if artifact.type == "xcodebuild" {
                    Button(action: {
                        router.route(to: .artifactXcodebuild(taskID: taskID, title: artifact.title))
                    }, label: {
                        HStack {
                            PrimaryLabel(artifact.title)
                            Spacer()
                            ValueLabel(artifact.type)
                            Image(systemName: "chevron.right")
                        }
                    })
                } else {
                    HStack {
                        PrimaryLabel(artifact.title)
                        Spacer()
                        ValueLabel(artifact.type)
                    }
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
