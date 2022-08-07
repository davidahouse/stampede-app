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

    @EnvironmentObject var service: StampedeService

    // MARK: - View

    var body: some View {
        Form {
            Section(header: SectionHeaderLabel("Stampede Server URL")) {
                TextField("Stampede Server URL", text: $service.stampedeServerURL)
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

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "withHost", viewModel: "some-host")
    }

    static var alternateViewModels: [PreviewData<String>] {
        [
        ]
    }

    static func create(from viewModel: String) -> some View {
        return SettingsStampedeServerView().previewDependencies()
    }
}
#endif
