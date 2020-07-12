//
//  DevicePreviewer.swift
//  Stampede
//
//  Created by David House on 5/10/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import StampedeCommon

#if DEBUG
struct DevicePreviewer<Content: View>: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    let deviceNames: [String] = [
        "iPhone SE",
        "iPhone 11 Pro Max",
        "iPad Pro (11-inch)"
    ]
    
    var body: some View {
        Group {
            content()
        }
        .previewDependencies()
    }
}
#endif
