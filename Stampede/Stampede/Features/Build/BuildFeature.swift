//
//  RepositoryBuildFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct BuildRoute: Route {
    
    let build: BuildStatus?
    let buildID: String?
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        if let build = build {
            return BuildFeature(dependencies: dependencies, buildStatus: build)
        } else {
            return BuildFeature(dependencies: dependencies, buildID: buildID ?? "")
        }
    }
    
    func makeView() -> any View {
        EmptyView()
    }
}

class BuildFeature: BaseFeature {
    
    // MARK: - Private Properties
    
    private var viewModel: BuildViewModel
    private var buildID: String?

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    BuildView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .environmentObject(routes)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - Initializer
    
    init(dependencies: Dependencies, buildStatus: BuildStatus) {
        viewModel = BuildViewModel(state: .results(buildStatus))
        super.init(dependencies: dependencies)
        title = buildStatus.buildIdentifier
    }
    
    init(dependencies: Dependencies, buildID: String) {
        viewModel = BuildViewModel(state: .loading)
        self.buildID = buildID
        super.init(dependencies: dependencies)
        title = buildID
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let buildID = buildID {
            viewModel.publisher = dependencies.service.fetchBuildDetailsPublisher(buildID: buildID)
        }
    }
}
