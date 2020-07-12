//
//  Previewer.swift
//  Stampede
//
//  Created by David House on 5/10/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

#if DEBUG
struct Previewer<Content: View>: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        Group {
            content()
                .environment(\.colorScheme, .light)
                .previewDisplayName("Light")
                .previewLayout(.sizeThatFits)
            content()
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark")
                .previewLayout(.sizeThatFits)
            content()
                .environment(\.sizeCategory, .extraSmall)
                .previewDisplayName("Extra Small Text")
                .previewLayout(.sizeThatFits)
            content()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewDisplayName("Extra Large Text")
                .previewLayout(.sizeThatFits)
        }
        .previewDependencies()
    }
}
#endif
