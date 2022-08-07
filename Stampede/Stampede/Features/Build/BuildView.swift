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
    @EnvironmentObject var service: StampedeService

    // MARK: - Initializer

    init(buildID: String, state: ViewModelState<BuildStatus>? = nil) {
        _viewModel = StateObject(wrappedValue: BuildViewModel(buildID: buildID, initialState: state))
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
        .task {
            await viewModel.fetch(service: service)
        }
    }
}

#if DEBUG
struct BuildView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        BuildView_Previews.devicePreviews
    }

    static var defaultViewModel: PreviewData<BuildViewModel> {
        PreviewData(id: "someResults", viewModel: BuildViewModel(buildID: BuildStatus.someActiveBuild.id, initialState: .results(BuildStatus.someActiveBuild)))
    }

    static var alternateViewModels: [PreviewData<BuildViewModel>] {
        [
            PreviewData(id: "successBuild", viewModel: BuildViewModel(buildID: BuildStatus.someRecentSuccessBuild.buildID, initialState: .results(BuildStatus.someRecentSuccessBuild))),
            PreviewData(id: "loading", viewModel: BuildViewModel(buildID: "123", initialState: .loading)),
            PreviewData(id: "networkError", viewModel: BuildViewModel(buildID: "123", initialState: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: BuildViewModel) -> some View {
        return BuildView(buildID: viewModel.buildID, state: viewModel.state)
    }
}
#endif
