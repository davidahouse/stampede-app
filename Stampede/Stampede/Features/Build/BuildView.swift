//
//  RepositoryBuildView.swift
//  Stampede-Mobile
//
//  Created by David House on 11/28/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import HouseKit

struct BuildView: View {

    // MARK: - Observed Objects

    @StateObject var viewModel: BuildViewModel

    // MARK: - Initializer

    init(state: ViewModelState<BuildStatus>) {
        _viewModel = StateObject(wrappedValue: BuildViewModel(state: state))
    }

    // MARK: - View

    var body: some View {
        BaseView(viewModel: viewModel, content: { buildStatus in
            List {
                Section(header: SectionHeaderLabel("Build Details")) {
                    HStack {
                        PrimaryLabel("Owner")
                        Spacer()
                        ValueLabel(buildStatus.buildDetails.owner)
                    }

                    HStack {
                        PrimaryLabel("Repository")
                        Spacer()
                        ValueLabel(buildStatus.buildDetails.repository)
                    }

                    HStack {
                        PrimaryLabel("Build Key")
                        Spacer()
                        ValueLabel(buildStatus.buildDetails.build_key)
                    }

                    HStack {
                        PrimaryLabel("Build #")
                        Spacer()
                        ValueLabel("\(buildStatus.buildDetails.build)")
                    }

                    HStack {
                        PrimaryLabel("Status")
                        Spacer()
                        ValueLabel(buildStatus.buildDetails.status)
                    }

                    HStack {
                        PrimaryLabel("Started At")
                        Spacer()
                        TimeLabel(time: buildStatus.buildDetails.started_at)
                    }

                    if let completed_at = buildStatus.buildDetails.completed_at {
                        HStack {
                            PrimaryLabel("Completed At")
                            Spacer()
                            TimeLabel(time: completed_at)
                        }
                    }

                    HStack {
                        PrimaryLabel("Duration")
                        Spacer()
                        ValueLabel(buildStatus.buildDetails.duration)
                    }
                }

                Section(header: SectionHeaderLabel("Tasks")) {
                    ForEach(buildStatus.tasks) { task in
                        NavigationLink(value: task) {
                            TaskStatusCell(taskStatus: task)
                        }
                    }
                }
            }
        })
        .navigationDestination(for: TaskDetails.self, destination: { task in
            BuildTaskView(taskID: task.task.id, state: .results(task))
        })
    }
}

#if DEBUG
struct BuildView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        BuildView_Previews.devicePreviews
    }

    static var defaultViewModel: PreviewData<BuildViewModel> {
        PreviewData(id: "someResults", viewModel: BuildViewModel(state: .results(BuildStatus.someActiveBuild)))
    }

    static var alternateViewModels: [PreviewData<BuildViewModel>] {
        [
            PreviewData(id: "successBuild", viewModel: BuildViewModel(state: .results(BuildStatus.someRecentSuccessBuild))),
            PreviewData(id: "loading", viewModel: BuildViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: BuildViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: BuildViewModel) -> some View {
        return BuildView(state: viewModel.state)
    }
}
#endif
