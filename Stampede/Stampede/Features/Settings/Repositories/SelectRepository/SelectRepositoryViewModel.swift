//
//  SelectRepositoryViewModel.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class SelectRepositoryViewModel: BaseViewModel<[Repository]> { }

#if DEBUG
extension SelectRepositoryViewModel {
    static let loading = SelectRepositoryViewModel(state: .loading)
    static let networkError = SelectRepositoryViewModel(state: .networkError)
    static let someRepositories = SelectRepositoryViewModel(state: .results(Repository.someRepositories))
}
#endif
