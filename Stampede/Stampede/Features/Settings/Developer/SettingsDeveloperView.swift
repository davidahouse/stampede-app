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
    @EnvironmentObject var viewModel: SettingsDeveloperViewModel

    var body: some View {
        List {
            Button(action: {
//                router.route(to: routes.routeSettingsDeveloperPersonaRoute())
            }, label: {
                HStack {
                    PrimaryLabel("Fixture Persona")
                    Spacer()
                    ValueLabel(viewModel.fixturePersona)
                    Image(systemName: "chevron.right")
                }
            })
        }
        .listStyle(DefaultListStyle())
    }
}

#if DEBUG
struct SettingsDeveloperView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        devicePreviews
    }

    static var defaultViewModel: PreviewData<SettingsDeveloperViewModel> {
        PreviewData(id: "developer", viewModel: SettingsDeveloperViewModel())
    }

    static var alternateViewModels: [PreviewData<SettingsDeveloperViewModel>] {
        [
        ]
    }

    static func create(from viewModel: SettingsDeveloperViewModel) -> some View {
        return SettingsDeveloperView().environmentObject(viewModel)
    }
}
#endif
