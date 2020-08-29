//
//  SelectRepositoryFeature.swift
//  Stampede
//
//  Created by David House on 8/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SelectRepositoryFeature: View {
    @EnvironmentObject var service: StampedeService
    
    let viewModel: SelectRepositoryViewModel
    let onSelected: (Repository) -> Void
    
    init(viewModel: SelectRepositoryViewModel? = nil, onSelected: @escaping (Repository) -> Void) {
        self.viewModel = viewModel ?? SelectRepositoryViewModel()
        self.onSelected = onSelected
    }
        
    var body: some View {
        NavigationView {
            SelectRepositoryView(viewModel: viewModel, publisher: service.fetchRepositoriesPublisher(), onSelected: onSelected)
                .navigationBarTitle("Select Repository")
        }
    }
}

struct SelectRepositoryFeature_Previews: PreviewProvider {
    static var previews: some View {
        SelectRepositoryFeature(onSelected: { _ in })
    }
}
