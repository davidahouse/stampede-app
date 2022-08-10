//
//  FeatureRouteCell.swift
//  Stampede
//
//  Created by David House on 10/12/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct FeatureRouteCell: View {
    
    let title: String

    var body: some View {
        HStack {
            PrimaryLabel(title)
        }
        .accessibility(identifier: title)
    }
}

#if DEBUG
struct FeatureRouteCell_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<String>] {
        [
            PreviewData(id: "routeCell", viewModel: "Testing")
        ]
    }

    static func create(from viewModel: String) -> some View {
        return FeatureRouteCell(title: viewModel)
    }
}
#endif
