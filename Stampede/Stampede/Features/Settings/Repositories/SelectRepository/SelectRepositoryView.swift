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

struct SelectRepositoryView: View {
    
    @ObservedObject var viewModel: SelectRepositoryViewModel
    let onSelected: (Repository) -> Void

    init(viewModel: SelectRepositoryViewModel, publisher: AnyPublisher<[Repository], ServiceError>? = nil, onSelected: @escaping (Repository) -> Void) {
        self.viewModel = viewModel
        self.onSelected = onSelected
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
                            .contentShape(Rectangle())
                            .onTapGesture(perform: {
                                self.onSelected(item)
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
        SelectRepositoryView(viewModel: SelectRepositoryViewModel.loading, onSelected: { _ in })
        SelectRepositoryView(viewModel: SelectRepositoryViewModel.networkError, onSelected: { _ in })
        SelectRepositoryView(viewModel: SelectRepositoryViewModel.someRepositories, onSelected: { _ in })
    }
}
#endif
