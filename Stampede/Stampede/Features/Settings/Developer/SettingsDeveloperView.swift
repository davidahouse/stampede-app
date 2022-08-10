//
//  DeveloperView.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsDeveloperView: View {

    // MARK: - Environment Objects

    @EnvironmentObject var theme: CurrentTheme
    @EnvironmentObject var service: StampedeService

    var body: some View {
        List {
            NavigationLink(destination: {
                SettingsDeveloperPersonaView()
            }, label: {
                HStack {
                    PrimaryLabel("Fixture Persona")
                    Spacer()
                    ValueLabel(service.persona)
                }
            })
        }
        .listStyle(DefaultListStyle())
    }
}

#if DEBUG
struct SettingsDeveloperView_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<String>] {
        [
            PreviewData(id: "developer", viewModel: "None")
        ]
    }

    static func create(from viewModel: String) -> some View {
        return SettingsDeveloperView()
    }
}
#endif
