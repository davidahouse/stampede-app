//
//  MainFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/1/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MainFeature: View {

    @EnvironmentObject var repositoryList: RepositoryList
    
    let viewModel: MainViewModel

    init(viewModel: MainViewModel? = nil) {
        self.viewModel = viewModel ?? MainViewModel()
    }
    
    // MARK: - View

    var body: some View {
        NavigationView {
            MainView(viewModel: viewModel, publisher: repositoryList.fetchRepositoriesPublisher())
            .navigationTitle("Stampede")
        }
    }
}

#if DEBUG
struct MainFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            MainFeature()
        }
    }
}
#endif
