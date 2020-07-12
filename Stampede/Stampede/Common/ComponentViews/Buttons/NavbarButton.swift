//
//  NavbarButton.swift
//  Stampede-Mobile
//
//  Created by David House on 1/2/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct NavbarButton: View {

    // MARK: - Properties
    
    private let title: String
    private let action: () -> Void

    // MARK: - Initializer
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    // MARK: - View
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
        })
    }
}

#if DEBUG
struct NavbarButton_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            NavbarButton("NavButton", action: {})
        }
    }
}
#endif
