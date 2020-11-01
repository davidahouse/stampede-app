//
//  NetworkErrorView.swift
//  Stampede
//
//  Created by David House on 4/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI
import HouseKit

struct NetworkErrorView: View {
    
    let error: ServiceError
    
    var body: some View {
        VStack {
            PrimaryLabel("Network error received. Check your stampede server url in settings.")
            SecondaryLabel(error.errorDescription ?? "")
        }
    }
}

#if DEBUG
struct NetworkErrorView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        NetworkErrorView_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "errorView", viewModel: "Network error description")
    }

    static var alternateViewModels: [PreviewData<String>] {
        []
    }

    static func create(from viewModel: String) -> some View {
        return NetworkErrorView(error: .network(description: viewModel))
    }
}
#endif
