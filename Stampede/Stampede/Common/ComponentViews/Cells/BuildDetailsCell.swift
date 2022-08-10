//
//  BuildDetailsCell.swift
//  Stampede
//
//  Created by David House on 10/19/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct BuildDetailsCell: View {

    let buildDetails: BuildDetails

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                PrimaryLabel(buildDetails.repository)
                SecondaryLabel("\(buildDetails.build_key)-\(buildDetails.build)")
            }
            Spacer()
            ValueLabel(buildDetails.completedAgo)
        }
    }
}

#if DEBUG
struct BuildDetailsCell_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<BuildDetails>] {
        [
            PreviewData(id: "completedBuild", viewModel: BuildDetails.completedBuild)
        ]
    }

    static func create(from viewModel: BuildDetails) -> some View {
        return BuildDetailsCell(buildDetails: viewModel)
    }
}
#endif
