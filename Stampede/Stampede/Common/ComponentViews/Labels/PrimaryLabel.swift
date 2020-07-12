//
//  PrimaryLabel.swift
//  Stampede-Mobile
//
//  Created by David House on 1/2/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct PrimaryLabel: View {

    @EnvironmentObject var theme: CurrentTheme

    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title).font(.headline).foregroundColor(theme.primaryTextColor)
    }
}

#if DEBUG
struct PrimaryLabel_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            PrimaryLabel("Primary Title")
        }
    }
}
#endif
