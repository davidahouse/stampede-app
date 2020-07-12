//
//  SecondaryLabel.swift
//  Stampede-Mobile
//
//  Created by David House on 1/2/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SecondaryLabel: View {

    @EnvironmentObject var theme: CurrentTheme

    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title).font(.subheadline).foregroundColor(theme.secondaryTextColor)
    }
}

#if DEBUG
struct SecondaryLabel_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SecondaryLabel("Secondary Label")
        }
    }
}
#endif
