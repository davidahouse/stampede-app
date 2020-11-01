//
//  FeatureRouteCell.swift
//  Stampede
//
//  Created by David House on 10/12/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct FeatureRouteCell: View {
    
    @EnvironmentObject var router: Router
    
    let title: String
    let route: Route
    
    var body: some View {
        Button(action: {
            self.router.route(to: route)
        }, label: {
            HStack {
                PrimaryLabel(title)
                Spacer()
                Image(systemName: "chevron.right")
            }
        })
        .accessibility(identifier: title)
    }
}

#if DEBUG
struct FeatureRouteCell_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        FeatureRouteCell_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "routeCell", viewModel: "Testing")
    }

    static var alternateViewModels: [PreviewData<String>] {
        []
    }

    static func create(from viewModel: String) -> some View {
        return FeatureRouteCell(title: viewModel, route: MonitorActiveBuildsRoute())
    }
}
#endif
