//
//  RepositorySourceDetailsFeature.swift
//  Stampede
//
//  Created by David House on 10/20/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

struct RepositorySourceDetailsRoute: Route {
    
    let repository: Repository
    let buildKey: String
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return RepositorySourceDetailsFeature(dependencies: dependencies, repository: repository, buildKey: buildKey)
    }
}

class RepositorySourceDetailsFeature: BaseFeature {

    let repository: Repository
    let buildKey: String

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    private var viewModel = RepositorySourceDetailsViewModel()

    // MARK: - Initializer

    init(dependencies: Dependencies, repository: Repository, buildKey: String) {
        self.repository = repository
        self.buildKey = buildKey
        super.init(dependencies: dependencies)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    RepositorySourceDetailsView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .environmentObject(routes)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = buildKey
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.publisher = dependencies.service.fetchRepositorySourceDetails(owner: repository.owner, repository: repository.repository, buildKey: buildKey)
    }
}
