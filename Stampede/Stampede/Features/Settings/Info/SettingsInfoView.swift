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

    @StateObject var viewModel = SettingsInfoViewModel()

    var body: some View {
        List {
            PrimaryLabel("Version: \(viewModel.appVersion)")
            PrimaryLabel("Build: \(viewModel.appBuildNumber)")
            Button("https://stampedeci.com", action: {
                UIApplication.shared.open(URL(string: "https://stampedeci.com")!, options: [:]) { _ in

                }
            })
        }
        .listStyle(DefaultListStyle())
    }
}

#if DEBUG
struct SettingsInfoView_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<SettingsInfoViewModel>] {
        [
            PreviewData(id: "info", viewModel: SettingsInfoViewModel())
        ]
    }

    static func create(from viewModel: SettingsInfoViewModel) -> some View {
        return SettingsInfoView()
    }
}
#endif
