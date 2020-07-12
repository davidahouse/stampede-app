//
//  RepositoryFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import StampedeCommon

struct RepositoryFeature: View {

    let repository: Repository

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    let viewModel: RepositoryViewModel

    // MARK: Initializer

    init(repository: Repository, builds: [RepositoryBuild]? = nil, recent: [BuildStatus]? = nil) {
        viewModel = RepositoryViewModel()
        self.repository = repository
    }

    // MARK: - View

    var body: some View {
        RepositoryView(repository: repository, viewModel: viewModel)
//        .onAppear {
//            // give the view model a new publisher?
//            self.viewModel.buildsPublisher = self.service.fetchRepositoryBuildsPublisher(owner: self.repository.owner, repository: self.repository.repository)
//            self.viewModel.recentPublisher = self.service.fetchRecentBuildsPublisher(owner: self.repository.owner, repository: self.repository.repository)
//        }
//        .onDisappear {
//            // invalidate the publisher as we don't want
//            // the view to refresh while not visible?
//            self.viewModel.buildsPublisher = nil
//            self.viewModel.recentPublisher = nil
//        }
    }
}

#if DEBUG
struct RepositoryFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            RepositoryFeature(repository: Repository.someRepository, builds: RepositoryBuild.someBuilds, recent: BuildStatus.recentBuilds)
        }
    }
}
#endif
