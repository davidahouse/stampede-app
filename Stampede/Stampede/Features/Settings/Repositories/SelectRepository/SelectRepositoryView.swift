//
//  SelectRepositoryView.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit
import Combine

protocol SelectRepositoryDelegate: class {
    func didSelectRepository(_ repository: Repository)
}

struct SelectRepositoryView: View {
    
    @ObservedObject var viewModel: SelectRepositoryViewModel
    weak var delegate: SelectRepositoryDelegate?

    init(viewModel: SelectRepositoryViewModel, publisher: AnyPublisher<[Repository], ServiceError>? = nil, delegate: SelectRepositoryDelegate? = nil) {
        self.viewModel = viewModel
        self.delegate = delegate
        self.viewModel.publisher = publisher
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            Text("Loading ...")
        case .networkError:
            Text("A network error has occurred")
        case .results(let repositories):
            List {
                if repositories.count > 0 {
                    ForEach(repositories, id: \.self) { item in
                        RepositoryCell(repository: item)
                            .contentShape(Rectangle())
                            .onTapGesture(perform: {
                                delegate?.didSelectRepository(item)
                            })
                    }
                } else {
                    Text("No repositories selected")
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
}

#if DEBUG
struct SelectRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SelectRepositoryView(viewModel: SelectRepositoryViewModel.loading)
            SelectRepositoryView(viewModel: SelectRepositoryViewModel.networkError)
            SelectRepositoryView(viewModel: SelectRepositoryViewModel.someRepositories)
        }
    }
}
#endif
