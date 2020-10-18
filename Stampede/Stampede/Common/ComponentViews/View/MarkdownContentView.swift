//
//  MarkdownContentView.swift
//  Stampede
//
//  Created by David House on 10/18/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import SwiftyMarkdown

struct MarkdownContentView: UIViewRepresentable {

    var markdown: String

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        let markdownString = SwiftyMarkdown(string: emojify(markdown))
        label.attributedText = markdownString.attributedString()
        label.numberOfLines = 0
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        let markdownString = SwiftyMarkdown(string: emojify(markdown))
        uiView.attributedText = markdownString.attributedString()
    }

    private func emojify(_ input: String) -> String {
        return input
            .replacingOccurrences(of: ":warning:", with: "⚠️")
            .replacingOccurrences(of: ":white_check_mark:", with: "✅")
            .replacingOccurrences(of: ":rotating_light:", with: "🚨")
            .replacingOccurrences(of: ":heavy_exclamation_mark:", with: "❗️")
    }
}
