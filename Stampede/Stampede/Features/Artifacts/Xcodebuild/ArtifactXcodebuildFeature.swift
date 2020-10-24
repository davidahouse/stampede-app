//
//  ArtifactXcodebuildFeature.swift
//  Stampede
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//
import Foundation
import SwiftUI

class ArtifactXcodebuildFeature: BaseFeature {

    // MARK: - Static methods

    static func makeFeature(_ dependencies: Dependencies, taskID: String, title: String) -> BaseFeature {
        return ArtifactXcodebuildFeature(dependencies: dependencies, taskID: taskID, title: title)
    }

    let taskID: String
    let artifactTitle: String

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService

    // MARK: Properties

    private var viewModel = ArtifactClocViewModel()

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
//        viewModel.publisher = dependencies.service.fetchArtifactClocPublisher(taskID: taskID, title: artifactTitle)
    }
}
