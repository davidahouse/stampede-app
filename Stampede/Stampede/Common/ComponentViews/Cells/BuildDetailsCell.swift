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
struct BuildDetailsCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            BuildDetailsCell(buildDetails: BuildDetails.completedBuild)
        }
    }
}
#endif
