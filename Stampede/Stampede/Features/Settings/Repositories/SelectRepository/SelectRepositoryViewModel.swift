//
//  SelectRepositoryViewModel.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class SelectRepositoryViewModel: BaseViewModel<[Repository]> {
    
    public func fetch(service: StampedeService) async {
        state = await service.fetchRepositories()
    }
}

#if DEBUG
extension SelectRepositoryViewModel {
    static let loading = SelectRepositoryViewModel(state: .loading)
    static let networkError = SelectRepositoryViewModel(state: .networkError(.network(description: "some error")))
    static let someRepositories = SelectRepositoryViewModel(state: .results(Repository.someRepositories))
}
#endif
