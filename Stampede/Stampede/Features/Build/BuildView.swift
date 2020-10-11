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

    // MARK: - View

    var body: some View {
        List {
                Section(header: Text("Build Details")) {
                    HStack {
                        Text("Owner")
                        Spacer()
                        Text(viewModel.buildStatus.buildDetails.owner)
                    }

                    HStack {
                        Text("Repository")
                        Spacer()
                        Text(viewModel.buildStatus.buildDetails.repository)
                    }

                    HStack {
                        Text("Status")
                        Spacer()
                        Text("completed")
                    }

                    HStack {
                        Text("Started At")
                        Spacer()
                        PrimaryLabel("\(viewModel.buildStatus.buildDetails.started_at)")
                    }

                    if let completed_at = viewModel.buildStatus.buildDetails.completed_at {
                        HStack {
                            Text("Completed At")
                            Spacer()
                            PrimaryLabel("\(completed_at)")
                        }
                    }

                    HStack {
                        Text("Duration")
                        Spacer()
                        Text("12.3s")
                    }
                }

                Section(header: Text("Tasks")) {
                    ForEach(viewModel.buildStatus.tasks) { task in
                        Button(action: {
                            router.route(to: .taskDetails(task))
                        }, label: {
                            TaskStatusCell(taskStatus: task)
                        })
                    }
                }
        }
    }
}

#if DEBUG
struct BuildView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            BuildView().environmentObject(BuildViewModel(buildStatus: BuildStatus.someActiveBuild))
            BuildView().environmentObject(BuildViewModel(buildStatus: BuildStatus.someRecentSuccessBuild))
        }
    }
}
#endif
