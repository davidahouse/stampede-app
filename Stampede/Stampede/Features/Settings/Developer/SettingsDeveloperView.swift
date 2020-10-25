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
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel: SettingsDeveloperViewModel

    var body: some View {
        List {
            Button(action: {
                router.route(to: SettingsDeveloperPersonaRoute())
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
struct SettingsDeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsDeveloperView().environmentObject(SettingsDeveloperViewModel())
        }
    }
}
#endif
