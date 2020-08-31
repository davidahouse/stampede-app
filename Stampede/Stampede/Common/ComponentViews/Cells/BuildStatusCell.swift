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
            switch buildStatus.statusIndicator {
            case .inProgress:
                CurrentTheme.Icons.inProgress.image().font(Font.system(size: 32, weight: .regular))
            case .failure:
                CurrentTheme.Icons.failure.image().font(Font.system(size: 32, weight: .regular))
            case .success:
                CurrentTheme.Icons.success.image().font(Font.system(size: 32, weight: .regular))
            }
            VStack(alignment: .leading) {
                PrimaryLabel(buildStatus.buildIdentifier)
            }
            Spacer()
            ValueLabel(buildStatus.startedAgo)
        }
    }
}

struct BuildStatusCell_Previews: PreviewProvider {
    static var previews: some View {
        BuildStatusCell(buildStatus: BuildStatus.someRecentBuild)
    }
}
