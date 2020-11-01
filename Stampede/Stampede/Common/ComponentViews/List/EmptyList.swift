//
//  EmptyList.swift
//  Stampede-Mobile
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct EmptyList: View {
    
    // MARK: - Properties
    
    private let message: String
    
    // MARK: - Initializer
    
    init(_ message: String) {
        self.message = message
    }
    
    // MARK: - View
    
    var body: some View {
        List {
            PrimaryLabel(message)
        }
    }
}

#if DEBUG

struct EmptyList_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        EmptyList_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "emptyList", viewModel: "Empty list message goes here...")
    }

    static var alternateViewModels: [PreviewData<String>] {
        []
    }

    static func create(from viewModel: String) -> some View {
        return EmptyList(viewModel)
    }
}
#endif
