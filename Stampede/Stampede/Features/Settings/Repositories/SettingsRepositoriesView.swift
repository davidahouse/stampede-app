//
//  SettingsRepositoriesView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsRepositoriesView: View {
    var body: some View {
        List {
            StandardCell(viewModel: StandardCellViewModel(Repository.someRepository))
        }
        .listStyle(DefaultListStyle())
    }
}

struct SettingsRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsRepositoriesView()
        }
    }
}
