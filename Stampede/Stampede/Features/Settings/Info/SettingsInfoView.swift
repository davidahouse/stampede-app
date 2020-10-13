//
//  SettingsInfoView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsInfoView: View {

    // MARK: - Environment Objects

    @EnvironmentObject var theme: CurrentTheme

    // MARK: - Observed Objects

    @EnvironmentObject var viewModel: SettingsInfoViewModel

    var body: some View {
        List {
            Text("Version: \(viewModel.appVersion)")
            Text("Build: \(viewModel.appBuildNumber)")
            Button("https://stampedeci.com", action: {
                UIApplication.shared.open(URL(string: "https://stampedeci.com")!, options: [:]) { _ in

                }
            })
        }
        .listStyle(DefaultListStyle())
    }
}

struct SettingsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsInfoView().environmentObject(SettingsInfoViewModel())
    }
}
