//
//  SettingsRepositoriesFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsRepositoriesFeature: View {
    var body: some View {
        SettingsRepositoriesView()
            .navigationBarTitle("Repositories")
            .navigationBarItems(trailing:
                Button("Add") {
                    print("hello")
                }
            )
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
