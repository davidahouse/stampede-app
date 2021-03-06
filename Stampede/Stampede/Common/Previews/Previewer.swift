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
    
    static var defaultViewModel: PreviewData<ViewModel> { get }
    static var alternateViewModels: [PreviewData<ViewModel>] { get }
    static func create(from viewModel: ViewModel) -> Preview
}

struct PreviewData<ViewModel>: Identifiable {
    let id: String
    let viewModel: ViewModel
}

extension Previewable {
    static var debugPreviews: some View {
        Group {
            AnyView(create(from: defaultViewModel.viewModel))
                .environment(\.colorScheme, .light)
                .previewDisplayName("\(defaultViewModel.id) Light")
                .previewLayout(.sizeThatFits)
            AnyView(create(from: defaultViewModel.viewModel))
                .preferredColorScheme(.dark)
                .previewDisplayName("\(defaultViewModel.id) Dark")
                .previewLayout(.sizeThatFits)
            AnyView(create(from: defaultViewModel.viewModel))
                .environment(\.sizeCategory, .extraSmall)
                .previewDisplayName("\(defaultViewModel.id) Extra Small Text")
                .previewLayout(.sizeThatFits)
            AnyView(create(from: defaultViewModel.viewModel))
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewDisplayName("\(defaultViewModel.id) Extra Large Text")
                .previewLayout(.sizeThatFits)
            
            ForEach(alternateViewModels, id: \.id) { previewData in
                AnyView(create(from: previewData.viewModel))
                    .previewDisplayName("\(previewData.id) Light")
                    .previewLayout(.sizeThatFits)
            }
        }
        .previewDependencies()
    }

    static var devicePreviews: some View {
        Group {
            AnyView(create(from: defaultViewModel.viewModel))
                .environment(\.colorScheme, .light)
                .previewDisplayName("\(defaultViewModel.id) Light")
            AnyView(create(from: defaultViewModel.viewModel))
                .preferredColorScheme(.dark)
                .previewDisplayName("\(defaultViewModel.id) Dark")
            AnyView(create(from: defaultViewModel.viewModel))
                .environment(\.sizeCategory, .extraSmall)
                .previewDisplayName("\(defaultViewModel.id) Extra Small Text")
            AnyView(create(from: defaultViewModel.viewModel))
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewDisplayName("\(defaultViewModel.id) Extra Large Text")
            
            ForEach(alternateViewModels, id: \.id) { previewData in
                AnyView(create(from: previewData.viewModel))
                    .previewDisplayName("\(previewData.id) Light")
            }
        }
        .previewDependencies()
    }

    static func capturedPreviews(title: String) -> [(String, UIImage)] {
        
        var captured: [(String, UIImage)] = []
        
        let light = UIHostingController(rootView: AnyView(create(from: defaultViewModel.viewModel))
                .colorScheme(.light)
                .previewLayout(.sizeThatFits).previewDependencies())
        captured.append((title + "-" + defaultViewModel.id + "-" + "Light", light.capture(.light)))

        let dark = UIHostingController(rootView: AnyView(create(from: defaultViewModel.viewModel))
                .colorScheme(.dark)
                .previewLayout(.sizeThatFits).previewDependencies())
        captured.append((title + "-" + defaultViewModel.id + "-" + "Dark", dark.capture(.dark)))
        
        let extraSmallText = UIHostingController(rootView: AnyView(create(from: defaultViewModel.viewModel))
                                                    .colorScheme(.light)
                                                    .environment(\.sizeCategory, .extraSmall)
                .previewLayout(.sizeThatFits).previewDependencies())
        captured.append((title + "-" + defaultViewModel.id + "-" + "ExtraSmallText", extraSmallText.capture(.light)))
        
        let extraLargeText = UIHostingController(rootView: AnyView(create(from: defaultViewModel.viewModel))
                                                    .colorScheme(.light)
                                                    .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewLayout(.sizeThatFits).previewDependencies())
        captured.append((title + "-" + defaultViewModel.id + "-" + "ExtraLargeText", extraLargeText.capture(.light)))

        for previewData in alternateViewModels {
            let light = UIHostingController(rootView: AnyView(create(from: previewData.viewModel))
                    .colorScheme(.light)
                    .previewLayout(.sizeThatFits).previewDependencies())
            captured.append((title + "-" + previewData.id, light.capture(.light)))
        }
                
        return captured
    }
}

extension UIHostingController {
    
    func capture(_ style: UIUserInterfaceStyle) -> UIImage {
        self.overrideUserInterfaceStyle = style
        let size = sizeThatFits(in: UIScreen.main.bounds.size)
        view.bounds.size = size
        view.sizeToFit()
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        return snapshotImage
    }
}
#endif
