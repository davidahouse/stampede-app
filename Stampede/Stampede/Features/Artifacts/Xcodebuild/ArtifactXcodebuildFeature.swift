//
//  ArtifactXcodebuildFeature.swift
//  Stampede
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//
import Foundation
import SwiftUI

struct ArtifactXcodebuildRoute: Route {
    
    let taskID: String
    let title: String
    
    func makeFeature(_ dependencies: Dependencies) -> UIViewController {
        return ArtifactXcodebuildFeature(dependencies: dependencies, taskID: taskID, title: title)
    }
}

class ArtifactXcodebuildFeature: BaseFeature {

    let taskID: String
    let artifactTitle: String

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    private var viewModel = ArtifactXcodebuildViewModel()

    // MARK: - Initializer

    init(dependencies: Dependencies, taskID: String, title: String) {
        self.taskID = taskID
        artifactTitle = title
        super.init(dependencies: dependencies)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    ArtifactXcodebuildView()
                                    .environmentObject(viewModel)
                                    .environmentObject(router)
                                    .dependenciesToEnvironment(dependencies))
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = artifactTitle
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.publisher = dependencies.service.fetchArtifactXcodebuildPublisher(taskID: taskID, title: artifactTitle)
    }
}
