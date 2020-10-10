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

class SettingsRepositoriesFeature: BaseFeature<Dependencies> {
        
    var publisher: AnyPublisher<[Repository], ServiceError>?
    private var disposables = Set<AnyCancellable>()

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    SettingsRepositoriesView(viewModel: viewModel, delegate: self)
                                    .dependenciesToEnvironment(dependencies))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite Repositories"
        navigationItem.largeTitleDisplayMode = .automatic
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(SettingsRepositoriesFeature.didSelectAdd(sender:)))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc
    func didSelectAdd(sender: Any) {
        let selectRepository = SelectRepositoryFeature(dependencies: dependencies, delegate: self)
        present(selectRepository, animated: true) { }
    }

    override func viewDidAppear(_ animated: Bool) {
        reloadList()
    }
    
    let viewModel = SettingsRepositoriesViewModel()
    
    private func reloadList() {
        publisher = dependencies.repositoryList.fetchRepositoriesPublisher()
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
    
//    var body: some View {
//        SettingsRepositoriesView(viewModel: viewModel, publisher: repositoryList.fetchRepositoriesPublisher())
//            .navigationBarTitle("Repositories")
//            .navigationBarItems(trailing:
//                Button("Add") {
//                    self.showingSelectRepository = true
//                }
//            )
//            .sheet(isPresented: $showingSelectRepository, content: {
//                SelectRepositoryFeature(onSelected: { repository in
//                    repositoryList.addRepository(repository: repository)
//                    viewModel.fetch()
//                    self.showingSelectRepository = false
//                })
//            })
//    }
}

//#if DEBUG
//struct SettingsRepositoriesFeature_Previews: PreviewProvider {
//    static var previews: some View {
//        DevicePreviewer {
//            NavigationView {
//                SettingsRepositoriesFeature()
//            }
//        }
//    }
//}
//#endif

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
