//
//  SectionHeaderLabel.swift
//  Stampede
//
//  Created by David House on 1/12/21.
//  Copyright © 2021 David House. All rights reserved.
//

import SwiftUI

struct SectionHeaderLabel: View {
    
    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .font(.headline).foregroundColor(Color("primaryTextColor"))
    }
}

struct SectionHeaderLabel_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        debugPreviews
    }

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "someTitle", viewModel: "123")
    }

    static var alternateViewModels: [PreviewData<String>] {
        []
    }

    static func create(from viewModel: String) -> some View {
        return SectionHeaderLabel(viewModel)
    }
}
