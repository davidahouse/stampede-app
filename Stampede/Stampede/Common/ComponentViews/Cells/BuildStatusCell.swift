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
    
    let buildStatus: BuildStatus

    var body: some View {
        Button(action: {
            router.route(to: BuildRoute(build: buildStatus, buildID: nil))
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
struct BuildStatusCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            BuildStatusCell(buildStatus: BuildStatus.someActiveBuild)
            BuildStatusCell(buildStatus: BuildStatus.someRecentBuild)
        }
    }
}
#endif
