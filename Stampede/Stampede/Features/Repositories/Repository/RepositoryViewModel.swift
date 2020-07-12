//
//  RepositoryViewModel.swift
//  Stampede
//
//  Created by David House on 5/25/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import Combine

class RepositoryViewModel: BaseViewModel, ObservableObject {

    // MARK: - Published properties

    // MARK: - Properties

//    var buildsPublisher: AnyPublisher<[RepositoryBuild], StampedeError>? {
//        didSet {
//            self.fetch()
//        }
//    }
//
//    var recentPublisher: AnyPublisher<[BuildStatus], StampedeError>? {
//        didSet {
//            self.fetch()
//        }
//    }
    
    // MARK: - Initializer
//    init(builds: [RepositoryBuild]? = nil, recent: [BuildStatus]? = nil) {
//        if let initialBuilds = builds {
//            self.builds = .hasResults(results: initialBuilds)
//        }
//
//        if let initialRecent = recent {
//            self.recent = .hasResults(results: initialRecent)
//        }
//    }
    
//    override func fetch() {
//        self.buildsPublisher?.sink(receiveCompletion: { result in
//          if case let .failure(error) = result {
//            print("Error receiving \(error)")
//            DispatchQueue.main.async {
//                self.builds = .networkError
//            }
//          }
//        }, receiveValue: { value in
//            DispatchQueue.main.async {
//                if value.count > 0 {
//                    self.builds = .hasResults(results: value)
//                } else {
//                    self.builds = .empty(message: "No builds found")
//                }
//            }
//        }).store(in: &self.disposables)
//
//        self.recentPublisher?.sink(receiveCompletion: { result in
//          if case let .failure(error) = result {
//            print("Error receiving \(error)")
//            DispatchQueue.main.async {
//                self.recent = .networkError
//            }
//          }
//        }, receiveValue: { value in
//            DispatchQueue.main.async {
//                if value.count > 0 {
//                    self.recent = .hasResults(results: value)
//                } else {
//                    self.recent = .empty(message: "No recent builds found")
//                }
//            }
//        }).store(in: &self.disposables)
//    }
}

#if DEBUG

extension RepositoryViewModel {
//    static var someViewModel = RepositoryViewModel(builds: RepositoryBuild.someBuilds, recent: BuildStatus.recentBuilds)
//    static var someViewModelOnlyBuilds = RepositoryViewModel(builds: RepositoryBuild.someBuilds)
//    static var someViewModelOnlyRecents = RepositoryViewModel(recent: BuildStatus.recentBuilds)
}
#endif
