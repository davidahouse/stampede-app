//
//  SettingsDeveloperPersonaView.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

protocol SettingsDeveloperPersonaDelegate: class {
    func didSelectPersona(_ persona: String)
}

struct SettingsDeveloperPersonaView: View {

    // MARK: - Environment Objects

    @EnvironmentObject var theme: CurrentTheme

    // MARK: - Observed Objects

    @EnvironmentObject var viewModel: SettingsDeveloperPersonaViewModel

    weak var delegate: SettingsDeveloperPersonaDelegate?

    init(delegate: SettingsDeveloperPersonaDelegate? = nil) {
        self.delegate = delegate
    }

    var body: some View {
        List {
            ForEach(viewModel.personas, id: \.self) { persona in
                HStack {
                    PrimaryLabel(persona)
                    Spacer()

                    if viewModel.selectedPersona == persona {
                        Image(systemName: "checkmark").foregroundColor(.green)
                    }
                }.contentShape(Rectangle())
                .onTapGesture(perform: {
                    delegate?.didSelectPersona(persona)
                })
            }
        }
        .listStyle(DefaultListStyle())
    }
}

#if DEBUG
struct SettingsDeveloperPersonaView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsDeveloperPersonaView().environmentObject(SettingsDeveloperPersonaViewModel())
        }
    }
}
#endif
