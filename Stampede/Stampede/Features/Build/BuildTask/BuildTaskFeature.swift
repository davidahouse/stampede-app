//
//  RepositoryBuildTaskFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI

class BuildTaskFeature: BaseFeature {
    
    // MARK: - Static methods
    
    static func makeFeature(_ dependencies: Dependencies, task: TaskStatus) -> BaseFeature {
        return BuildTaskFeature(dependencies: dependencies, task: task)
    }
    
    // MARK: - Private Properties
    
    private var viewModel: BuildTaskViewModel

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    BuildTaskView(viewModel: viewModel)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - Initializer
    
    init(dependencies: Dependencies, task: TaskStatus) {
        viewModel = BuildTaskViewModel(task: task)
        super.init(dependencies: dependencies)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.task.task
        navigationItem.largeTitleDisplayMode = .automatic
    }
}
