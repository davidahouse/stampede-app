//
//  BuildKeyCell.swift
//  Stampede
//
//  Created by David House on 9/7/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct BuildKeyCell: View {
    let repository: Repository
    let buildKey: BuildKey

    @EnvironmentObject var router: Router

    var body: some View {
        Button(action: {
            router.route(to: RepositorySourceDetailsRoute(repository: repository, buildKey: buildKey.buildKey))
        }, label: {
            HStack {
                VStack(alignment: .leading) {
                    PrimaryLabel(buildKey.buildKey)
                }
                Spacer()
                ValueLabel(buildKey.startedAgo)
                Image(systemName: "chevron.right")
            }
        })
    }

}

#if DEBUG
struct BuildKeyCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            BuildKeyCell(repository: Repository.someRepository,
                         buildKey: BuildKey.someBranchKeys[0])
        }
    }
}
#endif
