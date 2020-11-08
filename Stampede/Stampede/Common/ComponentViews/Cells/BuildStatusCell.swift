//
//  BuildStatusCell.swift
//  Stampede
//
//  Created by David House on 8/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct BuildStatusCell: View {

    @EnvironmentObject var router: Router
    @EnvironmentObject var routes: Routes
    
    let buildStatus: BuildStatus

    var body: some View {
        Button(action: {
            router.route(to: routes.route(for: buildStatus))
        }, label: {
            HStack {
                VStack(alignment: .leading) {
                    PrimaryLabel(buildStatus.buildDetails.repository)
                    SecondaryLabel(buildStatus.buildIdentifier)
                }
                Spacer()
                ValueLabel(buildStatus.startedAgo)
                Image(systemName: "chevron.right")
            }
        })
    }
}

#if DEBUG
struct BuildStatusCell_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        BuildStatusCell_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<BuildStatus> {
        PreviewData(id: "someActiveBuild", viewModel: BuildStatus.someActiveBuild)
    }

    static var alternateViewModels: [PreviewData<BuildStatus>] {
        [
            PreviewData(id: "someRecentBuild", viewModel: BuildStatus.someRecentBuild)
        ]
    }

    static func create(from viewModel: BuildStatus) -> some View {
        return BuildStatusCell(buildStatus: viewModel)
    }
}
#endif
