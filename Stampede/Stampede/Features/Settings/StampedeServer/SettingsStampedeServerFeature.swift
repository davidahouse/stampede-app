//
//  StampedeServerFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsStampedeServerFeature: View {

    // MARK: - Environment

    @EnvironmentObject var service: StampedeService
    @EnvironmentObject var defaults: StampedeDefaults

    // MARK: - View

    var body: some View {
        SettingsStampedeServerView(viewModel: SettingsStampedeServerViewModel(stampedeServerURL: defaults.host ?? "", subject: service.hostPassthroughSubject))
    }

}

struct SettingsStampedeServerFeature_Previews: PreviewProvider {
    static var previews: some View {
        SettingsStampedeServerFeature()
    }
}
