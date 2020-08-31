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

struct SettingsRepositoriesView: View {
    
    @ObservedObject var viewModel: SettingsRepositoriesViewModel

    init(viewModel: SettingsRepositoriesViewModel, publisher: AnyPublisher<[Repository], ServiceError>? = nil) {
        self.viewModel = viewModel
        self.viewModel.publisher = publisher
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Owner - Repository")
                        }
                    }
                }
            }.redacted(reason: .placeholder)
        case .networkError:
            Text("A network error has occurred")
        case .results(let repositories):
            List {
                if repositories.count > 0 {
                    ForEach(repositories, id: \.self) { item in
                        RepositoryCell(repository: item)
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
struct SettingsRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsRepositoriesView(viewModel: SettingsRepositoriesViewModel(state: .loading))
            SettingsRepositoriesView(viewModel: SettingsRepositoriesViewModel(state: .networkError))
            SettingsRepositoriesView(viewModel: SettingsRepositoriesViewModel(state: .results(Repository.someRepositories)))
        }
    }
}
#endif
