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
protocol Previewable {
    associatedtype ViewModel
    associatedtype Preview: View
    
    static var viewModels: [PreviewData<ViewModel>] { get }
    static func create(from viewModel: ViewModel) -> Preview
}

struct PreviewData<ViewModel>: Identifiable {
    let id: String
    let viewModel: ViewModel
}

extension Previewable {
    static var previews: some View {
        Group {
            ForEach(viewModels, id: \.id) { previewData in
                create(from: previewData.viewModel)
                    .previewDisplayName("\(previewData.id)")
                    .previewLayout(.sizeThatFits)
            }
        }
        .previewDependencies()
    }
    
    @MainActor
    static func capturedPreviews(title: String) -> [(String, UIImage)] {
        
        var captured: [(String, UIImage)] = []
        
        if let light = ImageRenderer(content: previews.colorSchemePreview(.light)).uiImage {
            captured.append((title + "-" + "Light", light))
        }

        if let dark = ImageRenderer(content: previews.colorSchemePreview(.dark)).uiImage {
            captured.append((title + "-" + "Dark", dark))
        }

        if let extraSmallText = ImageRenderer(content: previews.sizeCategoryPreview(.extraSmall)).uiImage {
            captured.append((title + "-" + "ExtraSmallText", extraSmallText))
        }
        
        if let extraLargeText = ImageRenderer(content: previews.sizeCategoryPreview(.extraLarge)).uiImage {
            captured.append((title + "-" + "ExtraLargeText", extraLargeText))
        }

        return captured
    }
}
#endif
