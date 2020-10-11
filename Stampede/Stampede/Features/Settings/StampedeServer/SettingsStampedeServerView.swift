//
//  StampedeServerView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsStampedeServerView: View {
    // MARK: - Environment Objects
    @EnvironmentObject var theme: CurrentTheme

    // MARK: - Observed Objects

    @EnvironmentObject var viewModel: SettingsStampedeServerViewModel

    // MARK: - View

    var body: some View {
        Form {
            Section(header: Text("Stampede Server URL")) {
                TextField("Stampede Server URL", text: $viewModel.stampedeServerURL)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
        }
    }
}

#if DEBUG
struct SettingsStampedeServerView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsStampedeServerView().environmentObject(SettingsStampedeServerViewModel.someViewModel)
            SettingsStampedeServerView().environmentObject(SettingsStampedeServerViewModel.someViewModelWithNoHost).environmentObject(StampedeDefaults.defaultsWithNoHost)
        }

    }
}
#endif
