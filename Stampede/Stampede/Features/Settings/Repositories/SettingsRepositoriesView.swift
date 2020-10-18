//
//  SettingsRepositoriesView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit
import Combine

protocol SettingsRepositoriesViewDelegate: class {
    func didDeleteRepositories(_ indexSet: IndexSet)
}

struct SettingsRepositoriesView: View {

    // MARK: - View Model

    @EnvironmentObject var viewModel: SettingsRepositoriesViewModel

    // MARK: - Private Properties
    
    private weak var delegate: SettingsRepositoriesViewDelegate?

    // MARK: - Initializer
    
    init(delegate: SettingsRepositoriesViewDelegate? = nil) {
        self.delegate = delegate
    }
    
    // MARK: - Body
    
    var body: some View {
        BaseView(viewModel: viewModel) { repositories in
            List {
                if repositories.count > 0 {
                    ForEach(repositories, id: \.self) { item in
                        FavoriteRepositoryCell(repository: item)
                    }.onDelete(perform: { indexSet in
                        self.delegate?.didDeleteRepositories(indexSet)
                    })
                } else {
                    Text("No repositories selected")
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
}

#if DEBUG
struct SettingsRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsRepositoriesView().environmentObject(SettingsRepositoriesViewModel(state: .loading))
            SettingsRepositoriesView().environmentObject(SettingsRepositoriesViewModel(state: .networkError(.network(description: "some error"))))
            SettingsRepositoriesView().environmentObject(SettingsRepositoriesViewModel(state: .results(Repository.someRepositories)))
            SettingsRepositoriesView().environmentObject(SettingsRepositoriesViewModel(state: .results([])))
        }
    }
}
#endif
