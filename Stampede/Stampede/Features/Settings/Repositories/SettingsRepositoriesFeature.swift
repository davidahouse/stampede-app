//
//  SettingsRepositoriesFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
import HouseKit

class SettingsRepositoriesFeature: BaseFeature {

    // MARK: - Static methods
    
    static func makeFeature(_ dependencies: Dependencies) -> BaseFeature {
        return SettingsRepositoriesFeature(dependencies: dependencies)
    }
    
    // MARK: - Private properties
    
    private var viewModel = SettingsRepositoriesViewModel()
    
    // MARK: - Overrides

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SettingsRepositoriesView(viewModel: viewModel, delegate: self)
                                    .dependenciesToEnvironment(dependencies))
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite Repositories"
        navigationItem.largeTitleDisplayMode = .automatic
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(SettingsRepositoriesFeature.didSelectAdd(sender:)))
        navigationItem.rightBarButtonItem = addButton
    }

    override func viewDidAppear(_ animated: Bool) {
        reloadList()
    }

    // MARK: - Private methods
    
    @objc
    private func didSelectAdd(sender: Any) {
        let selectRepository = SelectRepositoryFeature(dependencies: dependencies, delegate: self)
        present(selectRepository, animated: true) { }
    }

    private func reloadList() {
        viewModel.publisher = dependencies.repositoryList.fetchRepositoriesPublisher()
    }
}

extension SettingsRepositoriesFeature: SettingsRepositoriesViewDelegate {

    func didDeleteRepositories(_ indexSet: IndexSet) {
        dependencies.repositoryList.removeRepositories(indexSet)
        reloadList()
    }
}

extension SettingsRepositoriesFeature: SelectRepositoryDelegate {

    func didSelectRepository(_ repository: Repository) {
        dependencies.repositoryList.addRepository(repository: repository)
        dismiss(animated: true, completion: {})
        reloadList()
    }
}
