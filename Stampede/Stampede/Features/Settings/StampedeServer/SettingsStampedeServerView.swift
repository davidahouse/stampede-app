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
struct SettingsStampedeServerView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        devicePreviews
    }

    static var defaultViewModel: PreviewData<SettingsStampedeServerViewModel> {
        PreviewData(id: "withHost", viewModel: SettingsStampedeServerViewModel.someViewModel)
    }

    static var alternateViewModels: [PreviewData<SettingsStampedeServerViewModel>] {
        [
            PreviewData(id: "noHost", viewModel: SettingsStampedeServerViewModel.someViewModelWithNoHost)
        ]
    }

    static func create(from viewModel: SettingsStampedeServerViewModel) -> some View {
        return SettingsStampedeServerView().environmentObject(viewModel)
    }
}
#endif
