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

    // MARK: - Observed Objects

    @EnvironmentObject var viewModel: SettingsDeveloperViewModel

    var body: some View {
        List {
            HStack {
                Button("Fixture Persona", action: {

                })
                Spacer()
                ValueLabel(viewModel.fixturePersona)
            }
        }
        .listStyle(DefaultListStyle())
    }
}

#if DEBUG
struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsDeveloperView().environmentObject(SettingsDeveloperViewModel())
        }
    }
}
#endif
