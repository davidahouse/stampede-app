//
//  MainFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/1/19.
//  Copyright © 2019 David House. All rights reserved.
//
import UIKit
import SwiftUI
import Combine
import HouseKit

class MainFeature: BaseFeature<Dependencies> {

    var viewModel = MainViewModel()
    var publisher: AnyPublisher<[Repository], ServiceError>?
    private var disposables = Set<AnyCancellable>()

    override func makeChildViewController() -> UIViewController {
        return UIHostingController(rootView:
                                    MainView(viewModel: viewModel)
                                    .dependenciesToEnvironment(dependencies))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        publisher = dependencies.repositoryList.fetchRepositoriesPublisher()

        title = "Stampede"
        navigationItem.largeTitleDisplayMode = .automatic
    }

    override func viewDidAppear(_ animated: Bool) {
        self.publisher?.sink(receiveCompletion: { result in
          if case let .failure(error) = result {
            print("Error receiving \(error)")
            DispatchQueue.main.async {
                self.viewModel.repositories = []
            }
          }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.viewModel.repositories = value
            }
        }).store(in: &self.disposables)
    }

//    @EnvironmentObject var repositoryList: RepositoryList
//
//    let viewModel: MainViewModel
//
//    init(viewModel: MainViewModel? = nil) {
//        self.viewModel = viewModel ?? MainViewModel()
//    }
//
//    // MARK: - View
//
//    var body: some View {
//        NavigationView {
//            MainView(viewModel: viewModel, publisher: repositoryList.fetchRepositoriesPublisher())
//            .navigationTitle("Stampede")
//        }
//    }
}

//#if DEBUG
//struct MainFeature_Previews: PreviewProvider {
//    static var previews: some View {
//        DevicePreviewer {
//            MainFeature()
//        }
//    }
//}
//#endif
