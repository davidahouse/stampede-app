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

class SelectRepositoryFeature: BaseFeature<Dependencies> {
    
    let viewModel = SelectRepositoryViewModel(state: .loading)
    var publisher: AnyPublisher<[Repository], ServiceError>?
    private var disposables = Set<AnyCancellable>()
    weak var delegate: SelectRepositoryDelegate?

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SelectRepositoryView(viewModel: viewModel, delegate: delegate)
//                                    { repository in
//                                        self.dependencies.repositoryList.addRepository(repository: repository)
//                                        self.dismiss(animated: true, completion: {})
//                                    })
                                    .dependenciesToEnvironment(dependencies))
    }

    init(dependencies: Dependencies, delegate: SelectRepositoryDelegate?) {
        self.delegate = delegate
        super.init(dependencies: dependencies)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Favorite"
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    override func viewDidAppear(_ animated: Bool) {
        publisher = dependencies.service.fetchRepositoriesPublisher()
        self.publisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.viewModel.state = .networkError
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.viewModel.state = .results(value)
            }
        }).store(in: &self.disposables)
    }
    
//    let viewModel: SelectRepositoryViewModel
//    let onSelected: (Repository) -> Void
//    
//    init(viewModel: SelectRepositoryViewModel? = nil, onSelected: @escaping (Repository) -> Void) {
//        self.viewModel = viewModel ?? SelectRepositoryViewModel()
//        self.onSelected = onSelected
//    }
//        
//    var body: some View {
//        NavigationView {
//            SelectRepositoryView(viewModel: viewModel, publisher: service.fetchRepositoriesPublisher(), onSelected: onSelected)
//                .navigationBarTitle("Select Repository")
//        }
//    }
}

//#if DEBUG
//struct SelectRepositoryFeature_Previews: PreviewProvider {
//    static var previews: some View {
//        DevicePreviewer {
//            NavigationView {
//                SelectRepositoryFeature(onSelected: { _ in })
//            }
//        }
//    }
//}
//#endif
