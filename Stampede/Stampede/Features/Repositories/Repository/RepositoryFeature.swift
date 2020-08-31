//
//  RepositoryFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct RepositoryFeature: View {

    let repository: Repository

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    let viewModel: RepositoryViewModel

    // MARK: Initializer

    init(repository: Repository, viewModel: RepositoryViewModel? = nil) {
        self.viewModel = viewModel ?? RepositoryViewModel()
        self.repository = repository
    }

    // MARK: - View

    var body: some View {
        RepositoryView(viewModel: viewModel, activeBuildsPublisher: service.fetchActiveBuildsPublisher(owner: repository.owner, repository: repository.repository), repositoryBuildsPublisher: service.fetchRepositoryBuildsPublisher(owner: repository.owner, repository: repository.repository))
            .navigationBarTitle(repository.repository)
    }
}

#if DEBUG
struct RepositoryFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                RepositoryFeature(repository: Repository.someRepository)
            }
        }
    }
}
#endif
