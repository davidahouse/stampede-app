//
//  SettingsRepositoriesFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsRepositoriesFeature: View {
    
    @EnvironmentObject var repositoryList: RepositoryList
    @State var showingSelectRepository = false
    
    let viewModel: SettingsRepositoriesViewModel

    init(viewModel: SettingsRepositoriesViewModel? = nil) {
        self.viewModel = viewModel ?? SettingsRepositoriesViewModel()
    }
        
    var body: some View {
        SettingsRepositoriesView(viewModel: viewModel, publisher: repositoryList.fetchRepositoriesPublisher())
            .navigationBarTitle("Repositories")
            .navigationBarItems(trailing:
                Button("Add") {
                    self.showingSelectRepository = true
                }
            )
            .sheet(isPresented: $showingSelectRepository, content: {
                SelectRepositoryFeature(onSelected: { repository in
                    repositoryList.addRepository(repository: repository)
                    viewModel.fetch()
                    self.showingSelectRepository = false
                })
            })
    }
}

#if DEBUG
struct SettingsRepositoriesFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                SettingsRepositoriesFeature()
            }
        }
    }
}
#endif
