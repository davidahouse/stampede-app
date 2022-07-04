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

    // MARK: - View Model

    @EnvironmentObject var viewModel: SettingsRepositoriesViewModel
    @EnvironmentObject var repositoryList: RepositoryList
    
    // MARK: - Body
    
    var body: some View {
        List {
            if repositoryList.repositories.count > 0 {
                ForEach(repositoryList.repositories, id: \.self) { item in
                    FavoriteRepositoryCell(repository: item)
                }.onDelete(perform: { indexSet in
                    repositoryList.removeRepositories(indexSet)
                })
            } else {
                PrimaryLabel("No repositories selected")
            }
        }
        .listStyle(DefaultListStyle())
        .toolbar {
            Button("Add") {
                // TODO: Move to the select repository view so we can select a new repository to add
            }
        }
    }
}

#if DEBUG
struct SettingsRepositoriesView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        devicePreviews
    }

    static var defaultViewModel: PreviewData<SettingsRepositoriesViewModel> {
        PreviewData(id: "someRepositories", viewModel: SettingsRepositoriesViewModel())
    }

    static var alternateViewModels: [PreviewData<SettingsRepositoriesViewModel>] {
        [
        ]
    }

    static func create(from viewModel: SettingsRepositoriesViewModel) -> some View {
        return SettingsRepositoriesView().environmentObject(viewModel)
    }
}
#endif
