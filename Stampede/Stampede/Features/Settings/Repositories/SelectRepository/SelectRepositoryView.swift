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
    
    // MARK: - View Model
    
    @EnvironmentObject var viewModel: SelectRepositoryViewModel
    
    // MARK: - Private Properties
    
    weak var delegate: SelectRepositoryDelegate?

    // MARK: - Initializer
    
    init(delegate: SelectRepositoryDelegate? = nil) {
        self.delegate = delegate
    }

    // MARK: - View
    
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
            SelectRepositoryView().environmentObject(SelectRepositoryViewModel.loading)
            SelectRepositoryView().environmentObject(SelectRepositoryViewModel.networkError)
            SelectRepositoryView().environmentObject(SelectRepositoryViewModel.someRepositories)
        }
    }
}
#endif
