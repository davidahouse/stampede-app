//
//  SettingsInfoFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsInfoFeature: View {

    @State var viewModel: SettingsInfoViewModel = SettingsInfoViewModel()
    
    var body: some View {
        SettingsInfoView(viewModel: viewModel)
            .navigationBarTitle("About Stampede")
    }
}

struct SettingsInfoFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                SettingsInfoFeature()
            }
        }
    }
}
