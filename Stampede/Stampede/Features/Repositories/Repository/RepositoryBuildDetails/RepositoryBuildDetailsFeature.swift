//
//  RepositoryBuildDetailsFeature.swift
//  Stampede
//
//  Created by David House on 10/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

struct RepositoryBuildDetailsRoute: Route {
    
    let repository: Repository
    let build: String
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return RepositoryBuildDetailsFeature(dependencies: dependencies, repository: repository, build: build)
    }
    
    func makeView() -> any View {
        EmptyView()
    }

}

class RepositoryBuildDetailsFeature: BaseFeature {

    let repository: Repository
    let build: String

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    private var viewModel: RepositoryBuildDetailsViewModel!

    // MARK: - Initializer

    init(dependencies: Dependencies, repository: Repository, build: String) {
        self.repository = repository
        self.build = build
        viewModel = RepositoryBuildDetailsViewModel(repository: repository, build: build)
        super.init(dependencies: dependencies)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    RepositoryBuildDetailsView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .environmentObject(routes)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = build
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
//        viewModel.activeBuildsPublisher = dependencies.service.fetchActiveBuildsPublisher(owner: repository.owner, repository: repository.repository)
//        viewModel.recentBuildsPublisher = dependencies.service.fetchRepositorySourceDetails(owner: repository.owner, repository: repository.repository, buildKey: build)
    }
}
