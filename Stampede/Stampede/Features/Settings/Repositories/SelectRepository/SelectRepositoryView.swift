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
    
    // MARK: - View Model
    
    @EnvironmentObject var service: StampedeService
    @EnvironmentObject var repositoryList: RepositoryList
    
    @StateObject var viewModel = SelectRepositoryViewModel()
    
    // MARK: - View
    
    var body: some View {
        BaseView(viewModel: viewModel, content: { repositories in
            List {
                if repositories.count > 0 {
                    ForEach(repositories, id: \.self) { item in
                        RepositoryCell(repository: item)
                            .contentShape(Rectangle())
                            .onTapGesture(perform: {
                                repositoryList.addRepository(repository: item)
                            })
                    }
                } else {
                    PrimaryLabel("No repositories selected")
                }
            }
            .listStyle(DefaultListStyle())
        })
        .onChange(of: repositoryList.repositories) { _ in
            
            viewModel.filter(using: repositoryList)
        }
        .task {
            await viewModel.fetch(service: service, list: repositoryList)
        }
    }
}

#if DEBUG
struct SelectRepositoryView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        devicePreviews
    }

    static var defaultViewModel: PreviewData<SelectRepositoryViewModel> {
        PreviewData(id: "someRepositories", viewModel: SelectRepositoryViewModel.someRepositories)
    }

    static var alternateViewModels: [PreviewData<SelectRepositoryViewModel>] {
        [
            PreviewData(id: "loading", viewModel: SelectRepositoryViewModel(state: .loading)),
            PreviewData(id: "networkError", viewModel: SelectRepositoryViewModel(state: .networkError(.network(description: "Some network error"))))
        ]
    }

    static func create(from viewModel: SelectRepositoryViewModel) -> some View {
        return SelectRepositoryView().environmentObject(viewModel)
    }
}
#endif
