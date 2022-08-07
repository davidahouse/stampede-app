//
//  SelectRepositoryViewModel.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

@MainActor
class SelectRepositoryViewModel: BaseViewModel<[Repository]> {
    
    var results: [Repository] = []
    
    public func fetch(service: StampedeService, list: RepositoryList) async {
        state = await service.fetchRepositories()
        switch state {
        case .results(let repositories):
            results = repositories
            filter(using: list)
        default:
            break
        }
    }
    
    public func filter(using list: RepositoryList) {
        // change state to repositories that aren't already favorites
        let filteredList = results.filter { !list.repositories.map({ $0.id }).contains($0.id) }
        state = .results(filteredList)
    }
}

#if DEBUG
extension SelectRepositoryViewModel {
    static let loading = SelectRepositoryViewModel(state: .loading)
    static let networkError = SelectRepositoryViewModel(state: .networkError(.network(description: "some error")))
    static let someRepositories = SelectRepositoryViewModel(state: .results(Repository.someRepositories))
}
#endif
