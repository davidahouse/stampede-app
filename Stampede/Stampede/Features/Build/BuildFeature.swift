//
//  RepositoryBuildFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

class BuildFeature: BaseFeature {

    // MARK: - Static methods
    
    static func makeFeature(_ dependencies: Dependencies, build: BuildStatus) -> BaseFeature {
        return BuildFeature(dependencies: dependencies, buildStatus: build)
    }
    
    // MARK: - Private Properties
    
    private var viewModel: BuildViewModel

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    BuildView(viewModel: viewModel, router: self)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - Initializer
    
    init(dependencies: Dependencies, buildStatus: BuildStatus) {
        viewModel = BuildViewModel(buildStatus: buildStatus)
        super.init(dependencies: dependencies)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.buildStatus.buildIdentifier
        navigationItem.largeTitleDisplayMode = .automatic
    }
}
