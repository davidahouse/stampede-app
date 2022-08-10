//
//  BuildStatusCell.swift
//  Stampede
//
//  Created by David House on 8/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct BuildStatusCell: View {

    let buildStatus: BuildStatus

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                PrimaryLabel(buildStatus.buildDetails.repository)
                SecondaryLabel(buildStatus.buildIdentifier)
            }
            Spacer()
            ValueLabel(buildStatus.startedAgo)
        }
    }
}

#if DEBUG
struct BuildStatusCell_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<BuildStatus>] {
        [
            PreviewData(id: "someActiveBuild", viewModel: BuildStatus.someActiveBuild),
            PreviewData(id: "someRecentBuild", viewModel: BuildStatus.someRecentBuild)
        ]
    }

    static func create(from viewModel: BuildStatus) -> some View {
        return BuildStatusCell(buildStatus: viewModel)
    }
}
#endif
