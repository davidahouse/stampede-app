//
//  RepositoryBuildTaskView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import Parma

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
                Section(header: SectionHeaderLabel("Summary")) {
                    Parma(emojify(taskDetails.summary))
                }
                if taskDetails.text != "" {
                    Section(header: SectionHeaderLabel("Text")) {
                        Parma(emojify(taskDetails.text))
                    }
                }
            }
        })
    }

    private func emojify(_ input: String) -> String {
        return input
            .replacingOccurrences(of: ":warning:", with: "⚠️")
            .replacingOccurrences(of: ":white_check_mark:", with: "✅")
            .replacingOccurrences(of: ":rotating_light:", with: "🚨")
            .replacingOccurrences(of: ":heavy_exclamation_mark:", with: "❗️")
    }
}

struct BuildTaskInformationView: View {

    let taskStatus: TaskStatus

    var body: some View {
        Section(header: SectionHeaderLabel("Task Information")) {
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
        Section(header: SectionHeaderLabel("SCM Information")) {
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

    @EnvironmentObject var viewModel: BuildTaskViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var routes: Routes

    var body: some View {
        Section(header: SectionHeaderLabel("Artifacts")) {
            ForEach(artifacts, id: \.self) { artifact in
                switch viewModel.categoryForArtifact(artifact) {
                case .hasRoute:
                    Button(action: {
                        router.route(to: routes.routeForArtifact(taskID, artifact: artifact))
                    }, label: {
                        HStack {
                            PrimaryLabel(artifact.title)
                            Spacer()
                            ValueLabel(artifact.type)
                            Image(systemName: "chevron.right")
                        }
                    })
                case .openURL:
                    HStack {
                        PrimaryLabel(artifact.title)
                        Spacer()
                        if let urlString = artifact.url, let url = URL(string: urlString) {
                            Link("Open", destination: url)
                            Image(systemName: "chevron.right")
                        } else {
                            ValueLabel(artifact.type)
                        }
                    }
                case .installplist:
                    HStack {
                        PrimaryLabel(artifact.title)
                        Spacer()
                        if let url = viewModel.appInstallURL(artifact) {
                            Link("Install", destination: url)
                            Image(systemName: "chevron.right")
                        } else {
                            ValueLabel(artifact.type)
                        }
                    }
                case .none:
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
struct BuildTaskView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        BuildTaskView_Previews.devicePreviews
    }

    static var defaultViewModel: PreviewData<BuildTaskViewModel> {
        PreviewData(id: "someResults", viewModel: BuildTaskViewModel(state: .results(TaskDetails.someTaskDetails)))
    }

    static var alternateViewModels: [PreviewData<BuildTaskViewModel>] {
        [
            PreviewData(id: "loading", viewModel: BuildTaskViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: BuildTaskViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: BuildTaskViewModel) -> some View {
        return BuildTaskView().environmentObject(viewModel)
    }
}
#endif
