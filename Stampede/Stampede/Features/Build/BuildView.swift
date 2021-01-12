//
//  RepositoryBuildView.swift
//  Stampede-Mobile
//
//  Created by David House on 11/28/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct BuildView: View {

    // MARK: - Observed Objects

    @EnvironmentObject var viewModel: BuildViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var routes: Routes

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
                        Text(buildStatus.buildDetails.started_at, style: .time)
                    }

                    if let completed_at = buildStatus.buildDetails.completed_at {
                        HStack {
                            PrimaryLabel("Completed At")
                            Spacer()
                            Text(completed_at, style: .time)
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
                        Button(action: {
                            router.route(to: routes.routeForTask(task.task_id))
                        }, label: {
                            TaskStatusCell(taskStatus: task)
                        })
                    }
                }
            }
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
        return BuildView().environmentObject(viewModel)
    }
}
#endif
