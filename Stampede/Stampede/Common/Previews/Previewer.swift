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
    
    @MainActor
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
    
    static func createForCapture(from viewModel: ViewModel) -> some View {
        create(from: viewModel)
                .previewLayout(.sizeThatFits)
    }
    
    @MainActor
    static func capturedPreviews(title: String) -> [(String, UIImage)] {
        
        var captured: [(String, UIImage)] = []
        
        for previewData in viewModels {
            let lightRenderer = ImageRenderer(content: createForCapture(from: previewData.viewModel)
                .colorSchemePreview(.light))
            if let light = lightRenderer.uiImage {
                captured.append((title + "-" + previewData.id + "-" + "Light", light))
            }
            
            if let dark = ImageRenderer(content: createForCapture(from: previewData.viewModel)
                .colorSchemePreview(.dark)).uiImage {
                captured.append((title + "-" + previewData.id + "-" + "Dark", dark))
            }
            
            if let extraSmallText = ImageRenderer(content: createForCapture(from: previewData.viewModel)
                .sizeCategoryPreview(.extraSmall)).uiImage {
                captured.append((title + "-" + previewData.id + "-" + "ExtraSmallText", extraSmallText))
            }
            
            if let extraLargeText = ImageRenderer(content: createForCapture(from: previewData.viewModel)
                .sizeCategoryPreview(.extraLarge)).uiImage {
                captured.append((title + "-" + previewData.id + "-" + "ExtraLargeText", extraLargeText))
            }
        }
        return captured
    }
}
#endif
