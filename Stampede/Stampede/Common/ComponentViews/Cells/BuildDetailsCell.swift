//
//  BuildDetailsCell.swift
//  Stampede
//
//  Created by David House on 10/19/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct BuildDetailsCell: View {

    @EnvironmentObject var router: Router

    let buildDetails: BuildDetails

    var body: some View {
        Button(action: {
            router.route(to: BuildRoute(build: nil, buildID: buildDetails.build_id))
        }, label: {
            HStack {
                VStack(alignment: .leading) {
                    PrimaryLabel(buildDetails.repository)
                    SecondaryLabel("\(buildDetails.build_key)-\(buildDetails.build)")
                }
                Spacer()
                ValueLabel(buildDetails.completedAgo)
                Image(systemName: "chevron.right")
            }
        })
    }
}

#if DEBUG
struct BuildDetailsCell_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        BuildDetailsCell_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<BuildDetails> {
        PreviewData(id: "completedBuild", viewModel: BuildDetails.completedBuild)
    }

    static var alternateViewModels: [PreviewData<BuildDetails>] {
        []
    }

    static func create(from viewModel: BuildDetails) -> some View {
        return BuildDetailsCell(buildDetails: viewModel)
    }
}
#endif
