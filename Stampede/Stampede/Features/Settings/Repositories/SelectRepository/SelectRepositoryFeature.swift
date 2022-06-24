//
//  SelectRepositoryFeature.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
import HouseKit

class SelectRepositoryFeature: BaseFeature {
    
    // MARK: - Private Properties
    
    private let viewModel = SelectRepositoryViewModel(state: .loading)
    private weak var delegate: SelectRepositoryDelegate?

    // MARK: - Overrides
    
    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SelectRepositoryView(delegate: delegate)
                                        .environmentObject(viewModel)
                                        .environmentObject(router)
                                        .dependenciesToEnvironment(dependencies))
    }

    // MARK: - Initializers
    
    init(dependencies: Dependencies, delegate: SelectRepositoryDelegate?) {
        self.delegate = delegate
        super.init(dependencies: dependencies)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Favorite"
        modalPresentationStyle = .fullScreen
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SelectRepositoryFeature.didSelectCancel(sender:)))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        viewModel.publisher = dependencies.service.fetchRepositoriesPublisher()
    }
    
    // MARK: - Private Methods
    
    @objc
    private func didSelectCancel(sender: Any) {
        dismiss(animated: true, completion: {})
    }
}
