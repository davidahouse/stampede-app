//
//  RepositoryFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI

struct RepositoryRoute: Route {
    
    let repository: Repository
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return RepositoryFeature(dependencies: dependencies, repository: repository)
    }
}

class RepositoryFeature: BaseFeature {
    
    let repository: Repository

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    private var viewModel: RepositoryViewModel!

    // MARK: - Initializer
    
    init(dependencies: Dependencies, repository: Repository) {
        self.repository = repository
        viewModel = RepositoryViewModel(repository: repository)
        super.init(dependencies: dependencies)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    RepositoryView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = repository.repository
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.activeBuildsPublisher = dependencies.service.fetchActiveBuildsPublisher(owner: repository.owner, repository: repository.repository)
        viewModel.repositoryBuildsPublisher = dependencies.service.fetchRepositoryBuildsPublisher(owner: repository.owner, repository: repository.repository)
        viewModel.branchKeysPublisher = dependencies.service.fetchBuildKeysPublisher(owner: repository.owner, repository: repository.repository, source: "branch-push")
        viewModel.releaseKeysPublisher = dependencies.service.fetchBuildKeysPublisher(owner: repository.owner, repository: repository.repository, source: "release")
        viewModel.pullRequestKeysPublisher = dependencies.service.fetchBuildKeysPublisher(owner: repository.owner, repository: repository.repository, source: "pull-request")
    }    
}
