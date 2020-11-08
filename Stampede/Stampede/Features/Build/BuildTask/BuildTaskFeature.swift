//
//  RepositoryBuildTaskFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI

struct BuildTaskRoute: Route {
    
    let taskID: String
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return BuildTaskFeature(dependencies: dependencies, taskID: taskID)
    }
}

class BuildTaskFeature: BaseFeature {

    // MARK: - Private Properties
    
    private var viewModel: BuildTaskViewModel
    private var taskID: String

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    BuildTaskView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .environmentObject(routes)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - Initializer
    
    init(dependencies: Dependencies, taskID: String) {
        viewModel = BuildTaskViewModel(state: .loading)
        self.taskID = taskID
        super.init(dependencies: dependencies)
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
        viewModel.publisher = dependencies.service.fetchTaskDetailsPublisher(taskID: taskID)
    }
}
